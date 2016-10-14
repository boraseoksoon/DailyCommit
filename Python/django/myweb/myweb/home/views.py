from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.

def index(request):
	msg = "My Message"
	return render(request,'index.html', {'message':msg})

	# return HttpResponse("Hello World!")

def about(request):
	return HttpResponse('<h1>home/about<h1>')

def contact(request):
	return HttpResponse('<h1>home/contac<h1>')

