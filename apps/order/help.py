from alipay import AliPay
from alipay import AliPayConfig
from django.conf import settings
from django.http import JsonResponse


def run(order_id, total_pay):
    app_private_key_string = open(settings.APP_PRIVATE_KEY_PATH).read()
    alipay_public_key_string = open(settings.ALIPAY_PUBLIC_KEY_PATH).read()
    alipay = AliPay(
        appid=settings.ALIPAY_APP_ID,
        app_notify_url=None,  # 默认回调url
        app_private_key_string=app_private_key_string,
        # 支付宝的公钥，验证支付宝回传消息使用，不是你自己的公钥,
        alipay_public_key_string=alipay_public_key_string,
        sign_type="RSA2",  # RSA 或者 RSA2
        debug=True,  # 默认False
        verbose=False,  # 输出调试数据
        config=AliPayConfig(timeout=15)  # 可选, 请求超时时间
    )

    # 如果你是Python 2用户（考虑考虑升级到Python 3吧），请确保非ascii的字符串为utf8编码：
    # subject = u"测试订单".encode("utf8")
    # 如果你是 Python 3的用户，使用默认的字符串即可
    subject = '天天生鲜%s' % order_id

    # 电脑网站支付，需要跳转到https://openapi.alipay.com/gateway.do? + order_string
    print(settings.ALIPAY_APP_RETURN_URL)
    order_string = alipay.api_alipay_trade_page_pay(
        out_trade_no=order_id,
        total_amount=str(total_pay),
        subject=subject,
        return_url=settings.ALIPAY_APP_RETURN_URL,
        notify_url="https://example.com/notify"  # 可选, 不填则使用默认notify url
    )

    return alipay._gateway + "?" + order_string


def check(order, order_id):
    app_private_key_string = open(settings.APP_PRIVATE_KEY_PATH).read()
    alipay_public_key_string = open(settings.ALIPAY_PUBLIC_KEY_PATH).read()
    alipay = AliPay(
        appid=settings.ALIPAY_APP_ID,  # 应用id
        app_notify_url=None,  # 默认回调url
        app_private_key_string=app_private_key_string,
        # 支付宝的公钥，验证支付宝回传消息使用，不是你自己的公钥,
        alipay_public_key_string=alipay_public_key_string,
        sign_type="RSA2",  # RSA 或者 RSA2
        debug=True  # 默认False True就会访问沙箱地址
    )

    # 调用支付宝交易查询接口
    while True:
        response = alipay.api_alipay_trade_query(order_id)

        """
            响应参数
            response = {              
                "trade_no": "2019092121001004070200176844", # 支付宝交易号
                "code": "10000", # 接口调用是否成功
                "invoice_amount": "20.00",
                "open_id": "20880072506750308812798160715407",
                "fund_bill_list": [
                  {
                    "amount": "20.00",
                    "fund_channel": "ALIPAYACCOUNT"
                  }
                ],
                "buyer_logon_id": "csq***@sandbox.com",
                "send_pay_date": "2019-09-21 13:29:17",
                "receipt_amount": "20.00",
                "out_trade_no": "out_trade_no15",
                "buyer_pay_amount": "20.00",
                "buyer_user_id": "2088102169481075",
                "msg": "Success",
                "point_amount": "0.00",
                "trade_status": "TRADE_SUCCESS", # 支付结果
                "total_amount": "20.00"
            }
         """

        code = response.get('code')

        if code == '10000' and response.get('trade_status') == 'TRADE_SUCCESS':
            # 支付成功
            # 获取支付宝交易号
            trade_no = response.get('trade_no')
            # 更新订单状态
            order.trade_no = trade_no
            order.order_status = 4  # 待评价状态
            order.save()
            # 返回结果
            return JsonResponse({'res': 3, 'message': '支付成功'})
        elif code == '40004' or (code == '10000' and response.get('trade_status') == 'WAIT_BUYER_PAY'):
            # 等待卖家付款
            # 业务处理失败，可能一会就会成功
            import time
            time.sleep(5)
        else:
            # 支付出错
            return JsonResponse({'res': 4, 'errmsg': '支付失败'})
    return JsonResponse({'res': 4, 'errmsg': '支付失败'})
