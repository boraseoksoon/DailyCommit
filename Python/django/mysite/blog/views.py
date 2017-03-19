# -*- coding: utf-8 -*-

from django.shortcuts import render

from django.views.generic import ListView, DetailView
from django.views.generic.dates import ArchiveIndexView, YearArchiveView, MonthArchiveView
from django.views.generic.dates import DayArchiveView, TodayArchiveView

# 테이블 조회를 위해 Post 모델 클래스를 임포트 한다.
from blog.models import Post

# Create your views here.

#--- ListView
# ListView 제네릭 뷰를 상속받아 PostLV 클래스형 뷰를 정의한다.
# ListView 제네릭 뷰는 테이블로부터 객체 리스트를 가져와 그 리스트를 출력한다.
class PostLV(ListView):
    # 대상 테이블명 지정
    model = Post
    # 템플릿 파일은 blog/post_all.html로 지정, 만약 지정하지 않으면 기본값 blog/post_list.html이 된다.
    template_name = 'blog/post_all.html'
    # 템플릿 파일로 넘겨주는 객체 리스트에 대한 컨텍스트 변수명을 'posts'로 지정한다 이렇게 별도로 지정하더라도,
    # 디폴트 컨텍스트 변수명인 'object_list' 역시 사용할 수 있다.
    context_object_name = 'posts'
    # 한 페이지에 보여주는 객체 리스트의 숫자는 2이다. 이렇게 paginate_by 속성을 정의하는 것만으로도 장고가
    # 제공하는 페이징 기능을 사용할 수 있다. 페이징 기능이 활성화 되면 객체 리스트 하단에 페이지를 이동할 수 있는 버튼을 만들 수 있다.
    paginate_by = 2

#--- DetailView
# DetailView 제네릭 뷰는 테이블로부터 특정 객체를 가져와 그 객체의 상세 정보를 출력하는데 테이블에서 특정 객체를 조회하기 위한 키는
# 기본키 대신 slug 속성을 사용하고 있다. 이 slug 파라미터는 URLConf 에서 추출해 뷰로 넘겨준다.
class PostDV(DetailView):
    # 대상 테이블은 Post 테이블이다 다른 속성들은 지정하지 않았으므로 디폴트값을 사용한다.
    model = Post

#--- ArchiveView (날짜 제네릭 뷰) => 테이블로부터 객체 리스트를 가져와 날짜 필드를 기준으로 최신 객체를 먼저 출력한다.
# 각 특성에 맞춰 UrlConf를 통해 파라미터를 넘겨줘야 한다.

class PostAV(ArchiveIndexView):
    model = Post
    # 기준이 되는 날짜 필드는 modify_date 컬럼을 사용한다 즉 변경 날짜가 최근인 포스트를 먼저 출력한다.
    date_field = 'modify_date'

class PostYAV(YearArchiveView):
    model = Post
    date_field = 'modify_date'
    # make_object_list가 True 면 해당 년도에 해당하는 객체의 리스트를 만들어서 템플릿에 넘겨준다.
    # 즉 템플릿 파일에서 object_list 컨텍스트 변수를 사용할 수 있다. 디폴트는 False이다.
    make_object_list = True

class PostMAV(MonthArchiveView):
    model = Post
    date_field = 'modify_date'

class PostDAV(DayArchiveView):
    model = Post
    date_field = 'modify_date'

class PostTAV(TodayArchiveView):
    model = Post
    date_field = 'modify_date'