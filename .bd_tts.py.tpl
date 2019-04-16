import sys
from aip import AipSpeech

""" 你的 APPID AK SK """
APP_ID = 'BAIDU_APP_ID'
API_KEY = 'BAIDU_API_KEY'
SECRET_KEY = 'BAIDU_SECRET_KEY'

client = AipSpeech(APP_ID, API_KEY, SECRET_KEY)

text = sys.argv[1]

print('send:')
print(text)
#exit(0)
result  = client.synthesis(text , 'zh', 1, {
    'vol': 8,
})

# 识别正确返回语音二进制 错误则返回dict 参照下面错误码
if not isinstance(result, dict):
    with open('auido.mp3', 'wb') as f:
        f.write(result)
