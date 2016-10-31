from django.contrib import admin
from blog.models import Post

# Register your models here.

class PostAdmin(admin.ModelAdmin):
	list_display = ('title', 'modify_date')			# PostAdmin class means how to display Post model in admin site of django.
	list_filter = ('modify_date',)		 
	search_field = ('title', 'content')
	prepopulated_fields = {'slug':('title',)}

admin.site.register(Post, PostAdmin)
