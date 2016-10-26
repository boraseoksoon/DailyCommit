from django.db.models.query import QuerySet
from django.http import JsonResponse

def json_reponse(qs):
	mylist = []
	for instance in qs:
		mylist.append({
			'id':instance.id,
			'title':instance.title,
			'content':instance.content,
			'created_at':instance.created_at,
			'updated_at':instance.updated_at, 
		})

	return JsonResponse(mylist, safe=False)

class BlogMiddleware(object):
    def __init__(self, get_response):
        self.get_response = get_response
        # One-time configuration and initialization.

    def __call__(self, request):
        # Code to be executed for each request before
        # the view (and later middleware) are called.

        response = self.get_response(request)

        # Code to be executed for each request/response after
        # the view is called.

	print "blog middleware test!!!!"

	if isinstance(response, QuerySet):
		return json_reponse(response)
	return response

    def test(self, request, response):
	print	"test!! tblog middleware!" 
	return reponse






