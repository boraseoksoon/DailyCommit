from django import forms
from .models import Comment

class CommentForm(forms.ModelForm):
	class Meta:
		model = Comment
		
		# this is commentd since what I need is not all like post type in comment. 
		# fields = '__all__' # be aware of field's' but not field''

		# so -> I changed it like below.
		fields = ('author', 'message')
