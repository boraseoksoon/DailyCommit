"""myproject URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from blog import views
from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^$', views.index, name='index'), # print post lists all.
    url(r'^new/$', views.post_new, name="post_new"), # add new post
    # url('r^(?P<pk>\d+)/$', views.post_detail, name="post_detail"), # post contents
    # fuck..... 'r should be r'..)	
    url(r'^(?P<pk>\d+)/$', views.post_detail, name="post_detail"), # post contents
    # url('r^(?P<pk>\d+)/comments/new/$', views.comment_new, name='comments'), # new comments created

   url(r'^(?P<pk>\d+)/comments/new/$', views.comment_new, name='comments'), # new comments created

   url(r'^(?P<post_pk>[0-9]+)/comments/(?P<pk>\d+)/edit/$', views.comment_edit, name='comment_edit')

]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
