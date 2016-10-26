from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from .models import Post, Article
# Create your views here.

''' 
def test_json(request):
	test_json = [{
		'test_json key': 'test_json value'
	}]
	
	return JsonResponse(test_json, safe=False)


def post_json(request):

	post_list = []
	post_queryset = Post.objects.all()

	for p in post_queryset:
		post_list.append({
			'title' : p.title,
			'content' : p.content,
			'created_at' : p.created_at,
			'updated_at' : p.updated_at
		})

	return JsonResponse(post_list, safe=False)

def article_json(request):

	article_list = []
	article_queryset = Article.objects.all()

	for a in article_queryset:
		article_list.append({
			'title' : a.title,
			'content' : a.content,
		        'created_at' : a.created_at,
			'updated_at' : a.updated_at
		})

	return JsonResponse(article_list, safe=False)
'''

def post_json(request):
	return Post.objects.all()
def article_json(request):
	return Article.objects.all()

