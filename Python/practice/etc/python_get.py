import urllib2

# python 2.x
print	urllib2.urlopen("http://google.com").read()

# python 3.x
'''
import urllib.request
urllib.request.urlopen("http://example.com/foo/bar").read()
'''

