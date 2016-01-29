#-*- coding: utf-8 -*-

from observer import *

observer = Observer()

while True:
    observer.get_items()
    time.sleep(10)
