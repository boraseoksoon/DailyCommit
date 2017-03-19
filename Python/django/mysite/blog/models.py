# -*- coding: utf-8 -*-

'''
파이썬 버전 2와 버전 3 간에 문자열 처리하는 방식이 다르다 장고에서 버전방식의 문자열 처리를 기준으로 정하고
버전 2와의 호환성을 유지하기 위해 이 2개의 임포트 문장이 필요하다
'''
from __future__ import unicode_literals
from django.utils.encoding import python_2_unicode_compatible

from django.db import models

# reverse() 함수를 사용하기 위한 임포트 문장. reverse() 는 URL 패턴을 만들어주는 장고의 내장함수이다.
from django.core.urlresolvers import reverse

# Create your models here.
@python_2_unicode_compatible
class Post(models.Model):
    # title 컬럼은 CharField이므로 한줄로 입력되며 컬럼에 대한 레이블은 Title, 최대 길이는 50글자로 설정하였다.
    title = models.CharField('Title!', max_length=50)
    # slug컬럼은 제목의 별칭이라고 할수 있다. SlugField에 unique 옵션을 추가해 특정 포스트를 검색시 기본 키 대신 사용이 가능하다.
    # allow_unicode 옵션을 추가하면 한글 처리가 가능하다. help_text는 해당 컬럼을 설명해주는 문구로 폼 화면에 나타난다.
    slug = models.SlugField('SLUG!', unique=True, allow_unicode=True, help_text='one word for title alias')
    # blank=True 는 빈칸도 가능함을 의미함.
    description = models.CharField('DESCRIPTION!', max_length=100, blank=True, help_text='simple description text')
    # TextField는 여러줄 입력이 가능하다(TextField == TEXT, CharField == varchar)
    content = models.TextField('CONTENT!')
    # auto_now_add 속성은 객체가 생성될 때의 시각을 자동으로 기록하게 한다.
    create_date = models.DateTimeField('Create Date', auto_now_add=True)
    # auto_now 속성은 객체가 데이터베이스에 저장될때의 시각을 자동으로 기록되게 한다 즉 객체의 변경시각이 기록된다.
    modify_date = models.DateTimeField('Modify Date', auto_now=True)

    # 필드 속성 외 필요한 파라미터가 있으면 Meta 내부 클래스로 정의한다
    class Meta:
        # 단수별칭을 post로 한다
        verbose_name = 'post'
        # 테이블의 복수별칭을 posts로 한다
        verbose_name_plural = 'posts'
        # 데이터베이스에 저장되는 테이블의 이름을 my_post로 지정한다 이 항목을 생략하면 디폴트는 '앱명_모델클래스명'이 테이블 명이 된다.
        db_table = 'blog_posts'
        # 모델 객체 리스트 출력시 modify_date 컬럼을 기준으로 내림차순으로 정렬한다.
        ordering = ('-modify_date',)

    # 객체를 문자열로 표현할 때 사용하는 함수.
    def __str__(self):
        return self.title
    #   return "%s %s" %s(self.title, self.description)

    # 이 메소드가 정의된 객체를 지칭하는 URL을 반환한다 메소드 내에서는 장고의 내장 함수인 reverse()로 호출한다.
    def get_absolute_url(self):
        return reverse('blog:post_detail', args=(self.slug,))

    # modify_date 컬럼을 기준으로 이전 포스트를 반환한다. 메소드 내에서는 장고의 내장 함수인 get_previous_by_modify_date()를 호출한다.
    def get_previous_post(self):
        return self.get_previous_by_modify_date()

    # modify_date 컬럼을 기준으로 다음 포스트를 반환한다. 메소드 내에서는 장고의 내장 함수인 get_next_by_modify_date()를 호출한다.
    def get_next_post(self):
        return self.get_next_by_modify_date()

