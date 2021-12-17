"""blog URL Configuration

    The `urlpatterns` list routes URLs to views.
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
from django.contrib import admin
# from django.conf import settings    # agregado del tuto
# from django.conf.urls.static import static    # agregado del tuto
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('appblog.urls')),    # Now all the request will directly be handled by the blog app.

    path('usuario', include('appuser.urls')),    # aplicación url
    # path('post/',include('apps.post.urls')),    # folder.aplicación.url
    # path('usuario/', include('apps.usuario.urls'))    # folder.aplicación.url
]


# if settings.DEBUG:
#     urlpatterns += urlpatterns: list[URLResolver]
