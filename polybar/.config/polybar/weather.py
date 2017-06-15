#!/bin/python

import urllib.request, json

city = "Bellerica"
api_key = "480f6e5190ddcc81f415d3ce8c3da384"
units = "Imperial"
unit_key = "F"

weather = eval(str(urllib.request.urlopen("http://api.openweathermap.org/data/2.5/weather?q={}&APPID={}&units={}".format(city, api_key, units)).read())[2:-1])
info = weather["weather"][0]["description"].capitalize()
temp = int(float(weather["main"]["temp"]))

print("%s, %i °%s" % (info, temp, unit_key))
