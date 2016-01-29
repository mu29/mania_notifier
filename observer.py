#-*- coding: utf-8 -*-

import urllib
import urllib2
from config import *
from bs4 import BeautifulSoup

class Observer:
    def __init__(self):
        self.login_url = 'https://www.itemmania.com/portal/user/login_form_ok.php'
        self.search_url = 'http://trade.itemmania.com/sell/list_search.html'
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
            print item.find('div', { 'class' : 'trade_title' }).text
