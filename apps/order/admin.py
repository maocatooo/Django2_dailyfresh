from django.contrib import admin
from .models import OrderGoods
from .models import OrderInfo
# Register your models here.
class BaseModelAdmin(admin.ModelAdmin):
    def save_model(self, request, obj, form, change):
        super().save_model(request, obj, form, change)
        # 发出任务，让celery worker重新生成首页静态页面
        print(obj)
        from celery_tasks.tasks import generate_static_index_html
        generate_static_index_html()

        # 清除缓存
        # cache.delete('index_page_data')

    def delete_model(self, request, obj):
        """
        删除表中数据时调用
        :param request:
        :param obj:
        :return:
        """
        super().delete_model(request, obj)
        from celery_tasks.tasks import generate_static_index_html
        generate_static_index_html()

        # 清除缓存
        # cache.delete('index_page_data')

@admin.register(OrderGoods)
class OrderGoodsAdmin(BaseModelAdmin):
    pass

@admin.register(OrderInfo)
class OrderInfoAdmin(BaseModelAdmin):
    pass
