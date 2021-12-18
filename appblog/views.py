from .forms import PostForm, CommentForm
# from .models import Post, Comment
from .models import *
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse
from django.shortcuts import render, get_object_or_404, redirect
from django.template.loader import get_template
from django.utils import timezone

from django.contrib.auth.models import User


# Create your views here.


# Listar post ordenado por fecha publicación
# def post_list(request):
#     posts = Post.objects.filter(
#         publish__lte=timezone.now()).order_by('publish')
#     return render(request, 'appblog/post_list.html', {'posts': posts})

# 👀 listar solo los que estan Published and are not Draft
# 💡 Utilizo el custom manager "published" que definí en "models.py"
def post_list(request):
    posts = Post.published.all()
    return render(request, 'appblog/post_list.html', {'posts': posts})


def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    return render(request, 'appblog/post_detail.html', {'post': post})


@login_required
def post_new(request):
    if request.method == "POST":
        form = PostForm(request.POST)
        if form.is_valid():
            post = form.save(commit=False)
            post.author = request.user
            post.publish = timezone.now()
            post.save()
            return redirect('post_detail', pk=post.pk)
    else:
        form = PostForm()
    return render(request, 'appblog/post_edit.html', {'form': form})


@login_required
def post_edit(request, pk):
    post = get_object_or_404(Post, pk=pk)
    if request.method == "POST":
        form = PostForm(request.POST, instance=post)
        if form.is_valid():
            post = form.save(commit=False)
            post.author = request.user
            post.publis = timezone.now()
            post.save()
            return redirect('post_detail', pk=post.pk)
    else:
        form = PostForm(instance=post)
    return render(request, 'appblog/post_edit.html', {'form': form})


@login_required
def post_remove(request, pk):
    post = get_object_or_404(Post, pk=pk)
    post.delete()
    return redirect('post_list')


# @permission_required
@login_required
def add_comment_to_post(request, pk):
    post = get_object_or_404(Post, pk=pk)
    if request.method == "POST":
        form = CommentForm(request.POST)
        if form.is_valid():
            comment = form.save(commit=False)
            comment.post = post
            comment.save()
            return redirect('post_detail', pk=post.pk)
    else:
        form = CommentForm()
    return render(request, 'appblog/add_comment_to_post.html', {'form': form})


@login_required
def comment_approve(request, pk):
    comment = get_object_or_404(Comment, pk=pk)
    comment.approve()
    return redirect('post_detail', pk=comment.post.pk)


@login_required
def comment_remove(request, pk):
    comment = get_object_or_404(Comment, pk=pk)
    comment.delete()
    return redirect('post_detail', pk=comment.post.pk)


# def login_required(function=None, redirect_field_name=REDIRECT_FIELD_NAME, login_url=None):
    """
    Decorator for views that checks that the user is logged in, redirecting
    to the log-in page if necessary.
    """

# def permission_required(perm, login_url=None, raise_exception=False):
    """
    Decorator for views that checks whether a user has a particular permission
    enabled, redirecting to the log-in page if necessary.
    If the raise_exception parameter is given the PermissionDenied exception
    is raised.
    """


def login(request):
    # 👇 esta vez le pasa a render solo un request y una url.
    return render(request, "registration/login.html")


def about_us(request):
    # 👇 esta vez le pasa a render solo un request y una url.
    return render(request, "appblog/about_us.html")



def filter_by_date(request):
    posts = Post.objects.all().order_by('created')
    return render(request, 'appblog/post_list.html', {'posts': posts})

def filter_by_date_reverse(request):
    posts = Post.objects.all().order_by('-created')
    return render(request, 'appblog/post_list.html', {'posts': posts})

def filter_by_category(request):
    posts = Post.objects.all().order_by('category')
    return render(request, 'appblog/post_list.html', {'posts': posts})

def filter_by_category_reverse(request):
    posts = Post.objects.all().order_by('-category')
    return render(request, 'appblog/post_list.html', {'posts': posts})


def filter_by_number_of_comments(request):
    # posts= Post.objects.filter(post.comments.count)
    posts= Post.objects.filter(publish__year=2021)
    return render(request, 'appblog/post_list.html', {'posts': posts})


#  all_posts = Post.objects.all()

# Post.objects.filter(publish__year=2020)

# Post.objects.filter(publish__year=2020, author__username='admin')
# Post.objects.filter(publish__year=2020) \
#             .filter(author__username='admin')

# Post.objects.order_by('title')
# Post.objects.order_by('-title')


 