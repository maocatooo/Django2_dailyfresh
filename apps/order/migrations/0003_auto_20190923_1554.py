# Generated by Django 2.2.5 on 2019-09-23 07:54

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('order', '0002_auto_20190916_1514'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='ordergoods',
            options={'verbose_name': '订单商品', 'verbose_name_plural': '订单商品'},
        ),
        migrations.AlterModelOptions(
            name='orderinfo',
            options={'verbose_name': '订单', 'verbose_name_plural': '订单'},
        ),
    ]