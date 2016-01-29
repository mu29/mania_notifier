#-*- coding: utf-8 -*-

import re
import urllib
import urllib2
from bs4 import BeautifulSoup
from config import *
from item import *

class Observer:
    def __init__(self):
        self.login_url = 'https://www.itemmania.com/portal/user/login_form_ok.php'
        self.search_url = 'http://trade.itemmania.com/sell/list_search.html'
        self.view_url = 'http://trade.itemmania.com/sell/view.html?id='
        self.cookie = self.generate_cookie()

    def generate_cookie(self):
        request = urllib2.Request(self.login_url)
        request.add_data(urllib.urlencode(USER_INFO))

        response = urllib2.urlopen(request)
        cookie = response.headers.get('Set-Cookie')
        return cookie

    def generate_queries(self):
        query = {
            'search_type' : 'sell',
            'search_game' : 138,
            'search_server' : 658,
            'search_goods' : 'item'
        }
        return urllib.urlencode(query)

    def get_soup(self, url):
        request = urllib2.Request(url, self.generate_queries())
        request.add_header('cookie', self.cookie)
        response = urllib2.urlopen(request)
        soup = BeautifulSoup(response.read(), 'html.parser')
        return soup

    def get_items(self):
        soup = self.get_soup(self.search_url)

        # 0번 리스트는 프리미엄 목록이니까 빼자
        result = soup.find_all('tbody', { 'class' : 'list_search_body' })[1]

        for item in result.find_all('tr'):
            title = item.find('div', { 'class' : 'trade_title' }).text.strip()
            price = item.find('td', { 'class' : 's_right g_red1' }).text
            price = int(re.search('([0-9,])+', price).group(0).replace(',', ''))
            link = self.view_url + item.find('a')['onclick'].split("'")[1]

            item = Item(title, price, link)

            for key in KEYWORD:
                if item.title.find(key) > 0:
                    if item.price < LOWER_THAN or item.price > HIGHER_THAN:
                        print item.title, item.price, item.link
