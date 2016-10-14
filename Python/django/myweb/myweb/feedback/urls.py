from django.conf.urls import url
from feedback import views

urlpatterns = [
	url(r'^list', views.list),
	url(r'^add', views.add),
	url(r'update', views.update),
]
