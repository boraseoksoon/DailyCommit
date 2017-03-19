# -*- coding: utf-8 -*-

# 파이썬 3 문법으로 작성하면 파이썬 2 환경에서 장고가 자동으로 변환해줌.
from __future__ import unicode_literals

from django.db import models
from django.utils.encoding import python_2_unicode_compatible

# Create your models here.

@python_2_unicode_compatible
class Bookmark(models.Model):
    title = models.CharField(max_length=100, blank=True, null=True) # blank : 공백유무 null : 널값 가능 유무
    url = models.URLField('url', unique=True)   # url : url 컬럼에 대한 레이블 문구

    # 객체를 문자열로 표현할 때 사용하는 함수.
    def __str__(self):
        # return self.title
        return "%s %s" %(self.title, self.url)
