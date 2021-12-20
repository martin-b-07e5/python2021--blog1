""" The `urlpatterns` list routes URLs to views.

    For more information please see: 
        https://docs.djangoproject.com/en/3.2/topics/http/urls/

    Examples:
    Function views
        1. Add an import:  from my_app import views
        2. Add a URL to urlpatterns:  path('', views.home, name='home')
    Class-based views
        1. Add an import:  from other_app.views import Home
        2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
    Including another URLconf
        1. Import the include() function: from django.urls import include, path
        2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
# from django.urls import include, path, re_path
from django.urls import include, path
from appblog.views import *
from django.conf import settings
from django.conf.urls import url
from django.conf.urls.static import static
from django.contrib import admin
from django.contrib.auth import views as auth_views
from . import views

# from .views import Index, Index2

urlpatterns = [
    # 👀 path('some_url_Name/', vista_a_la_que_llama, someName),
    path('accounts/', include('django.contrib.auth.urls')),

    path('', views.post_list, name='post_list'),    # tb muestra el home
    path('post/<int:pk>/', views.post_detail, name='post_detail'),
    path('post/new/', views.post_new, name='post_new'),
    path('post/<int:pk>/edit/', views.post_edit, name='post_edit'),
    path('post/<pk>/remove/', views.post_remove, name='post_remove'),

    url(r'^post/(?P<pk>\d+)/comment/$', views.add_comment_to_post, name='add_comment_to_post'),
    url(r'^comment/(?P<pk>\d+)/approve/$', views.comment_approve, name='comment_approve'),
    url(r'^comment/(?P<pk>\d+)/remove/$', views.comment_remove, name='comment_remove'),

    path('about_us/', about_us, name='about_us'),
    path('login/', login, name='login'),


    # --------------------
    path('filter_by_category_two/', filter_by_category_two, name='filter_by_category_two'),
    # --------------------
    path('filter_by_category/', filter_by_category, name='filter_by_category'),
    path('filter_by_category_reverse/', filter_by_category_reverse, name='filter_by_category_reverse'),
    # --------------------
    path('filter_by_title/', filter_by_title, name='filter_by_title'),
    path('filter_by_title_reverse/', filter_by_title_reverse, name='filter_by_title_reverse'),
    # --------------------
    path('filter_by_created/', filter_by_created, name='filter_by_created'),
    path('filter_by_created_reverse/', filter_by_created_reverse, name='filter_by_created_reverse'),

    path('filter_by_publish/', filter_by_publish, name='filter_by_publish'),
    path('filter_by_publish_reverse/', filter_by_publish_reverse, name='filter_by_publish_reverse'),

    path('filter_by_updated/', filter_by_updated, name='filter_by_updated'),
    path('filter_by_updated_reverse/', filter_by_updated_reverse, name='filter_by_updated_reverse'),
    # --------------------
    
    # --------------------
    # --------------------


    # 🔥 pending
    path('filter_by_number_of_comments/', filter_by_number_of_comments, name='filter_by_number_of_comments'),
]
