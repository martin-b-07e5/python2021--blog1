from django import forms
from .models import Post, Comment

# campos que aparecen al agregar un nuevo post
class PostForm(forms.ModelForm):
    class Meta:
        model = Post
        fields = ('category' ,'title', 'text', 'status')


# campos que aparecen al agregar un nuevo comentario en post existente
class CommentForm(forms.ModelForm):
    class Meta:
        model = Comment
        fields = ('author', 'text',)
