from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
]

# when using include, below does not work.
'''
from django.conf.urls import url, include
from django.contrib import admin
'''

'''
urlpatterns = [
    url(r'^$', 'index'),
]
'''
