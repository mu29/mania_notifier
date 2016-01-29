#-*- coding: utf-8 -*-

import time
from observer import *

observer = Observer()

while True:
    observer.get_items()
    time.sleep(60)
