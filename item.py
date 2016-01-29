#-*- coding: utf-8 -*-

class Item:
    def __init__(self, title, price, link):
        self.title = title.encode('utf-8')
        self.price = price
        self.link = link.encode('utf-8')
