#-*- coding: utf-8 -*-

import fbchat
from config import *
from item import *

class Notifier:
    def __init__(self):
        self.client = fbchat.Client(FB_ID, FB_PASS)

    def send_noti(self, item):
        msg = "%s [%d원]\n바로가기 : %s" % (item.title, item.price, item.link)
        print msg
        self.client.send(FB_UID, msg)
