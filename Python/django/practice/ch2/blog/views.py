# from django.shortcuts import render
from django.views.generic import ListView, DetailView
from django.views.generic.dates import ArchiveIndexView, YearArchiveView, MonthArchiveView
from django.views.generic.dates import DayArchiveView, TodayArchiveView

from blog.models import Post

# Create your views here.

# -- ListView
class PostLV(ListView) : 
	model = Post
	template_name = 'blog/post_all.html'	# specify the template html file name. otherwise, by default, blog/post_list.html
	context_object_name = 'posts'		# specify the object name a tempalte can see and handle.
	paginate_by = 2				# pagenation provided by django.

# -- DetailView
class PostDV(DetailView):
	model = Post

# -- ArchiveViews
class PostAV(ArchiveIndexView):
	model = Post
	date_field = 'modify_date'

class PostYAV(YearArchiveView):
	model = Post
	date_field = 'modify_date'
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

