
from alipay import AliPay
from alipay import AliPayConfig
import os

DIR = os.path.dirname(__file__)
app_private_key_string = open(DIR + "/apk").read()
alipay_public_key_string = open(DIR + "/ali_public_key.pem").read()

appid = "2016091400510193"


alipay = AliPay(
    appid=appid,
    app_notify_url=None,  # 默认回调url
    app_private_key_string=app_private_key_string,
    # 支付宝的公钥，验证支付宝回传消息使用，不是你自己的公钥,
    alipay_public_key_string=alipay_public_key_string,
    sign_type="RSA", # RSA 或者 RSA2
    debug=False,  # 默认False
    verbose=False,  # 输出调试数据
    config=AliPayConfig(timeout=15)  # 可选, 请求超时时间
)

# 如果你是Python 2用户（考虑考虑升级到Python 3吧），请确保非ascii的字符串为utf8编码：
# subject = u"测试订单".encode("utf8")
# 如果你是 Python 3的用户，使用默认的字符串即可
subject = "测试订单"

# 电脑网站支付，需要跳转到https://openapi.alipay.com/gateway.do? + order_string
order_string = alipay.api_alipay_trade_page_pay(
    out_trade_no="2088102175609058",
    total_amount=0.01,
    subject=subject,
    return_url="https://example.com",
    notify_url="https://example.com/notify" # 可选, 不填则使用默认notify url
)

print("https://openapi.alipay.com/gateway.do?" + order_string)