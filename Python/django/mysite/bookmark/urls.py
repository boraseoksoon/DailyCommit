# -*- coding: utf-8 -*-

from django.conf.urls import url
from bookmark.views import BookmarkDV, BookmarkLV

urlpatterns = [
    # Class-Based-View(CBV!)

    # Example : /bookmark/
    # URL 패턴의 이름 : bookmark:index
    url(r'^$', BookmarkLV.as_view(), name='index'),

    # Example : /bookmark/pk/
    # URL 패턴의 이름 :  bookmark:detail
    url(r'^(?P<pk>\d+)/$', BookmarkDV.as_view(), name='detail')
]
