from django.http import JsonResponse
from django.db import transaction
from django.shortcuts import render, redirect
from django.urls import reverse
from django.conf import settings
from django.views.generic import View
from django_redis import get_redis_connection
from apps.user.models import Address
from apps.goods.models import GoodsSKU
from apps.order.models import OrderInfo, OrderGoods
from utils.mixin import LoginRequiredMixin
from datetime import datetime


# /order/place
class OrderPlaceView(LoginRequiredMixin, View):
    """提交订单页面显示"""
    
    def post(self, request):
        """提交订单页面显示"""
        # 获取我们的登录用户
        user = request.user
        # 获取参数sku_ids
        sku_ids = request.POST.getlist('sku_ids')
        
        # 校验参数
        if not sku_ids:
            # cart page
            return redirect(reverse('cart:show'))
        
        conn = get_redis_connection('default')
        cart_key = 'cart_%d' % user.id
        
        skus = []
        # 保存商品的总家属和总价
        total_count = 0
        total_price = 0
        # 便利sku_ids获取用户要购买的商品的信息
        for sku_id in sku_ids:
            # 根据商品的id获取商品的信息
            sku = GoodsSKU.objects.get(id=sku_id)
            # 获取用户要购买的商品的数量
            count = conn.hget(cart_key, sku_id)
            
            # bugfix redis显示问题
            count = count.decode()
            
            # 计算商品的小计
            amount = sku.price * int(count)
            # 动态给sku增加属性count,保存购买商品的数量
            sku.count = count
            # 动态给sku添加属性amount,保存购买商品的小计
            sku.amount = amount
            # 追加
            skus.append(sku)
            # 累加计算商品的总价和总剑术
            total_count += int(count)
            total_price += amount
        
        # 云飞： 世纪开发的时候，属于一个子系统
        transit_price = 10  # 写思
        
        # 是付款
        total_pay = total_price + transit_price
        
        # 获取用户的首见地址
        addrs = Address.objects.filter(user=user)
        
        # 组织上下文
        sku_ids = ','.join(sku_ids)  # [1, 25]->1, 25
        context = {'skus': skus,
                   'total_count': total_count,
                   'total_price': total_price,
                   'transit_price': transit_price,
                   'total_pay': total_pay,
                   'addrs': addrs,
                   'sku_ids': sku_ids}
        
        # 使用模板
        return render(request, 'place_order.html', context)


# 前端传递的参数: 地址的id 支付方法(pay_method), 用户要购买的商品id
# 悲观锁：执行的时候加琐 用户抢锁
class OrderCommitView(View):
    """订单创建"""
    
    # 事务装饰器
    @transaction.atomic
    def post(self, request):
        """订单创建"""
        # 判断用户是否登录,非后台无法使用LoginRequiredMixin验证
        user = request.user
        if not user.is_authenticated:
            # 用户美登录
            return JsonResponse({'res': 0, 'errmsg': '用户未登录'})
        
        # 接受参数
        addr_id = request.POST.get('addr_id')
        pay_method = request.POST.get('pay_method')
        sku_ids = request.POST.get('sku_ids')
        
        # 校验参数
        if not all([addr_id, pay_method, sku_ids]):
            return JsonResponse({'res': 1, 'errmsg': '参数不完整'})
        
        # 校验支付方式
        if pay_method not in OrderInfo.PAY_METHODS.keys():
            return JsonResponse({'res': 2, 'errmsg': '非法的支付方式'})
        
        # 校验地址
        try:
            addr = Address.objects.get(id=addr_id)
        except Address.DoesNotExist:
            return JsonResponse({'res': 3, 'errmsg': '地址不存在'})
        
        # 组织参数
        # 订单id： 年月日时间+用户id
        order_id = datetime.now().strftime('%Y%m%d%H%M%S') + str(user.id)
        
        # 运费
        transit_price = 10
        
        # 总数木和总金额
        total_count = 0
        total_price = 0
        
        # 设置事务保存点
        save_id = transaction.savepoint()
        try:
            # 向df_order_info表中添加一条记录
            order = OrderInfo.objects.create(order_id=order_id,
                                             user=user,
                                             addr=addr,
                                             pay_method=pay_method,
                                             total_count=total_count,
                                             total_price=total_price,
                                             transit_price=transit_price)
            
            # 用户的订单中有几个商品，需要向df_order_goods表中加入几条记录
            conn = get_redis_connection('default')
            cart_key = 'cart_%d' % user.id
            
            sku_ids = sku_ids.split(',')
            for sku_id in sku_ids:
                # 获取商品的信息
                try:
                    # 悲观锁：select * from df_goods_sku where id=sku_id for update; for update 为加琐操作
                    sku = GoodsSKU.objects.select_for_update().get(id=sku_id)
                except:
                    transaction.savepoint_rollback(save_id)
                    return JsonResponse({'res': 4, 'errmsg': '商品不存在'})
                
                # 从redis中获取用户所要购买的商品的数量
                count = conn.hget(cart_key, sku_id)
                
                # 判断商品的库存
                if int(count) > sku.stock:
                    transaction.savepoint_rollback(save_id)
                    return JsonResponse({'res': 6, 'errmsg': ' 商品库存不足'})
                
                # 向df_order_goods表中添加一条记录
                OrderGoods.objects.create(order=order,
                                          sku=sku,
                                          count=count,
                                          price=sku.price)
                
                #  更新商品的库存和销量
                sku.stock -= int(count)
                sku.sales += int(count)
                sku.save()
                
                #  累加计算订单商品的总数量和总价格
                amount = sku.price * int(count)
                total_count += int(count)
                total_price += amount
            
            # 更新订单信息表中的商品的总数量和总价格
            order.total_count = total_count
            order.total_price = total_price
            order.save()
        except Exception as e:
            transaction.savepoint_rollback(save_id)
            return JsonResponse({'res': 7, 'errmsg': '下单失败'})
        
        # 提交事务
        transaction.savepoint_commit(save_id)
        conn.hdel(cart_key, *sku_ids)  # 拆包
        # 返回应答
        return JsonResponse({'res': 5, 'message': '创建成功'})


class OrderPayView(View):
    """订单支付"""
    
    def post(self, request):
        """订单支付"""
        # 用户是否登录
        user = request.user
        if not user.is_authenticated:
            return JsonResponse({'res': 0, 'errmsg': '用户未登录'})
        
        # 接收参数
        order_id = request.POST.get('order_id')
        
        # 校验参数
        if not order_id:
            return JsonResponse({'res': 1, 'errmsg': '无效的订单id'})
        
        try:
            print(order_id)
            order = OrderInfo.objects.filter(order_id=order_id,
                                             user=user,
                                             # pay_method=3,
                                             order_status=1).first()
            print(order)
            if not order:
                return JsonResponse({'res': 2, 'errmsg': '订单错误'})
        except OrderInfo.DoesNotExist:
            return JsonResponse({'res': 2, 'errmsg': '订单错误'})
        total_pay = order.total_price + order.transit_price
        from .help import run
        response = run(order_id, total_pay)

        return JsonResponse({'res': 3, 'pay_url': response})


# ajax post
# 前端传递参数 order_id
# /order/check
class CheckPayView(View):
    """查询订单支付结果"""
    
    def post(self, request):
        """查询支付结果"""
        # 用户是否登录
        user = request.user
        if not user.is_authenticated:
            return JsonResponse({'res': 0, 'errmsg': '用户未登陆'})
        
        # 接收参数
        order_id = request.POST.get('order_id')
        
        # 校验参数
        if not order_id:

            return JsonResponse({'res': 1, 'errmsg': '无效的订单id'})
        try:
            order = OrderInfo.objects.get(order_id=order_id,
                                          user=user,
                                          # pay_method=3,
                                          order_status=1)

        except OrderInfo.DoesNotExist:
            return JsonResponse({'res': 2, 'errmsg': '订单错误'})
        
        from .help import check
        return check(order, order_id)


class CommentView(LoginRequiredMixin, View):
    """订单评论"""
    
    def get(self, request, order_id):
        """提供评论页面"""
        user = request.user
        # 校验数据
        if not order_id:
            return redirect(reverse('user:order'))
        
        try:
            order = OrderInfo.objects.get(order_id=order_id, user=user)
        except OrderInfo.DoesNotExist:
            return redirect(reverse("user:order"))
        
        # 根据订单的状态获取订单的状态标题
        order.status_name = OrderInfo.ORDER_STATUS[order.order_status]
        
        # 获取订单商品信息
        order_skus = OrderGoods.objects.filter(order_id=order_id)
        for order_sku in order_skus:
            # 计算商品的小计
            amount = order_sku.count * order_sku.price
            # 动态给order_sku增加属性amount,保存商品小计
            order_sku.amount = amount
        # 动态给order增加属性order_skus, 保存订单商品信息
        order.order_skus = order_skus
        
        # 使用模板
        return render(request, "order_comment.html", {"order": order})
    
    def post(self, request, order_id):
        """处理评论内容"""
        user = request.user
        # 校验数据
        if not order_id:
            return redirect(reverse('user:order'))
        
        try:
            order = OrderInfo.objects.get(order_id=order_id, user=user)
        except OrderInfo.DoesNotExist:
            return redirect(reverse("user:order"))
        
        # 获取评论条数
        total_count = request.POST.get("total_count")
        total_count = int(total_count)
        
        # 循环获取订单中商品的评论内容
        for i in range(1, total_count + 1):
            # 获取评论的商品的id
            sku_id = request.POST.get("sku_%d" % i)  # sku_1 sku_2
            # 获取评论的商品的内容
            content = request.POST.get('content_%d' % i, '')  # cotent_1 content_2 content_3
            try:
                order_goods = OrderGoods.objects.get(order=order, sku_id=sku_id)
            except OrderGoods.DoesNotExist:
                continue
            
            order_goods.comment = content
            order_goods.save()
        
        order.order_status = 5  # 已完成
        order.save()
        
        return redirect(reverse("user:order", kwargs={"page": 1}))
