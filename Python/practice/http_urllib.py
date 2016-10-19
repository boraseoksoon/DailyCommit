import httplib, urllib

# -*- coding: utf-8 -*-
 
params = urllib.urlencode({'query': 'naver search test'})
conn = httplib.HTTPConnection("search.naver.com")
conn.request('GET', '/search.naver?' + params)
response = conn.getresponse()
print response.status, response.reason
 
data = response.read()
print data
conn.close()
