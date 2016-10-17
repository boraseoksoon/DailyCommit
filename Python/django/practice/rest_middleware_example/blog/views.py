from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from .models import Post, Article


# Create your views here.
'''

def json_response(qs):
	mylist = []
	for instance in qs:
		mylist.append({ 
			'id':instance.id,
			'title':instance.title,
			'content':instance.content,
			'created':instance.created_at,
			'updated':instance.updated_at,
		})

	return JsonResponse(mylist, safe=False)


def post_list(request):
	qs = Post.objects.all()
	return json_response(qs)

def recent_post_list(request):
	qs = Post.objects.order_by('-id')[:2]
	return json_response(qs)

def article_list(request):
	qs = Article.objects.all() 
	return json_response(qs)


''' 

def post_list(request):
	return Post.objects.all()

def recent_post_list(request):
	return Post.objects.order_by('-id')[:2]

def article_list(request):
	return Article.objects.all()

