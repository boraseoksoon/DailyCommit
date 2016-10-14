from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
# Create your views here.


def list(request):
	msg = []
	msg.append('test1')
	msg.append('test2')
	return JsonResponse({'message':msg})


def add(request):
	return HttpResponse('<h1>add</h1>')	


def update(request):
	return HttpResponse('<h1>udpate</h1>')
