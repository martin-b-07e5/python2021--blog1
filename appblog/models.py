from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User

# slug
from django.template.defaultfilters import slugify
from django.urls import reverse


# Create your models here.

# 👀👀 Solo devuelve los publicados
# Definirla arriba de la invocación.
class PublishedManager(models.Manager):
    # 💡 Add the custom manager.
    def get_queryset(self):
        return super(PublishedManager,
                     self).get_queryset()\
            .filter(status='published')

# ----------------------------------------------------------------------
class Post(models.Model):
    # 💡 Definimos las noticias a ser mostradas.
    STATUS_CHOICES = (
        ('draft', 'Draft'),
        ('published', 'Published'),
    )
    CATEGORIES_CHOICES = (
        ('objetivos_del_milenio' ,'Objetivos del Milenio'),
        ('onu' ,'ONU'),
        ('organización_internacional' ,'Organización internacional'),
        ('uncategorized', 'Sin categoría'),
    )
    title = models.CharField(max_length=200)
    slug = models.SlugField(max_length=200, unique_for_date='publish')
    author = models.ForeignKey('auth.User', on_delete=models.CASCADE)
    text = models.TextField()
    publish = models.DateTimeField(default=timezone.now)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    status = models.CharField(
        max_length=10,
        choices=STATUS_CHOICES,
        # default='draft'
        default='published'
        )
    category = models.CharField(
        max_length=30,
        choices=CATEGORIES_CHOICES,
        default='uncategorized'
        )
    # ------------------------------
    objects = models.Manager()    # The default manager. 👀
    published = PublishedManager()    # Our custom manager. 👀👀
    # ✍👀 You have now defined your custom manager and added it to the Post model;
    # 💡👀 you can use it to perform queries.
    # ------------------------------
    class Meta:
        # 💡 Definimos el orden de las Posts
        # ordering = ('-publish',)
        # ordering = ('created',)
        ordering = ('-created',)    # los mas nuevos primeros
        # ordering = ('title',)

    def __str__(self):
        return self.title

    def save(self, *args, **kwargs):
        # 💡 generar_slug_automaticamente
        self.slug = slugify(self.title)
        super(Post, self).save(*args, **kwargs)

# https://docs.djangoproject.com/en/2.2/ref/models/fields/#field-types
    # https://apuntes-snicoper.readthedocs.io/es/latest/programacion/python/django/generar_slug_automaticamente.html
# ----------------------------------------------------------------------

    def approve(self):
        # if user.is_authenticated:
            self.approved_comment = True
            self.save()

    def __str__(self):
        return self.text


# by NPA
class Comment(models.Model):
    post = models.ForeignKey('appblog.Post', on_delete=models.CASCADE, related_name='comments')
    author = models.CharField(max_length=200, verbose_name="Autor")
    text = models.TextField(verbose_name="Comentario")
    publish = models.DateTimeField(default=timezone.now)
    approved_comment = models.BooleanField(default=False)



"""
slug: This is a field intended to be used in URLs.
          A slug is a short label that contains only letters, numbers, underscores, or hyphens.
          You will use the slug field to build beautiful, SEO-friendly URLs for your blog posts.
            You have added the unique_for_date parameter to this field so that you can build URLs for posts using their publish date and slug.
            Django will prevent multiple posts from having the same slug for a given date.
"""
