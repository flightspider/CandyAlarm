import os
import sys
import requests
import time
from xml.etree import ElementTree

try:
    input = raw_input
except NameError:
    pass


class TextToSpeech(object):
    def __init__(self, subscription_key):
        self.subscription_key = subscription_key
#        self.tts = input("What would you like to convert to speech: ")
        #self.tts = text
        self.timestr = time.strftime("%Y%m%d-%H%M")
        self.access_token = None
    def set_text(self,text):
        self.tts = text

    def get_token(self):
        fetch_token_url = "https://southeastasia.api.cognitive.microsoft.com/sts/v1.0/issueToken"
        headers = {
            'Ocp-Apim-Subscription-Key': self.subscription_key
        }
        response = requests.post(fetch_token_url, headers=headers)
        self.access_token = str(response.text)

    def save_audio(self):
        base_url = 'https://southeastasia.tts.speech.microsoft.com/'
        path = 'cognitiveservices/v1'
        constructed_url = base_url + path
        headers = {
            'Authorization': 'Bearer ' + self.access_token,
            'Content-Type': 'application/ssml+xml',
            'X-Microsoft-OutputFormat': 'riff-24khz-16bit-mono-pcm',
            'User-Agent': 'First_Group'
        }
        xml_body = ElementTree.Element('speak', version='1.0')
        xml_body.set('{http://www.w3.org/XML/1998/namespace}lang', 'zh-cn')
        voice = ElementTree.SubElement(xml_body, 'voice')
        voice.set('{http://www.w3.org/XML/1998/namespace}lang', 'zh-CN')
        voice.set(
            'name', 'Microsoft Server Speech Text to Speech Voice (zh-CN, XiaoxiaoNeural)')
        voice.text = self.tts
        body = ElementTree.tostring(xml_body)

        response = requests.post(constructed_url, headers=headers, data=body)
        if response.status_code == 200:
            with open('audio.wav', 'wb') as audio:
            #with open('sample-' + self.timestr + '.wav', 'wb') as audio:
                audio.write(response.content)
                print("\nStatus code: " + str(response.status_code) +
                      "\nYour TTS is ready for playback.\n")
        else:
            print("\nStatus code: " + str(response.status_code) +
                  "\nSomething went wrong. Check your subscription key and headers.\n")


if __name__ == "__main__":
    subscription_key = "b019f3e3d2c046c8baae5c757e383ce4"
    #subscription_key = "4d32cb7ac75c451598caa355f05b2b45"
    app = TextToSpeech(subscription_key)
    words=str(sys.argv[1])
    print("saying:" + words)
    app.set_text(words)
    app.get_token()
    app.save_audio()
