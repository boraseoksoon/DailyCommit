from django.conf.urls import url
from . import views

urlpatterns = [
	url(r'^post.json$', views.post_list),
	url(r'^recent_posts.json$', views.recent_post_list),
	url(r'^articles.json$', views.article_list), 
]
