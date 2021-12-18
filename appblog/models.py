from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User


# Create your models here.

# add the custom manager: 👀👀
# solo devuelve los publicados
class PublishedManager(models.Manager):
    def get_queryset(self):
        return super(PublishedManager,
                     self).get_queryset()\
            .filter(status='published')


# acá definimos las noticias a ser mostradas
class Post(models.Model):

    STATUS_CHOICES = (
        ('draft', 'Draft'),
        ('published', 'Published'),
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
        default='draft'
        )

    objects = models.Manager()    # The default manager. 👀
    published = PublishedManager()    # Our custom manager. 👀👀
    # ✍👀 You have now defined your custom manager and added it to the Post model; you can use it to perform queries.

    # testing (método llamado desde post_detail.html)
    def publishx(self):
        print("hola")
        self.publish = timezone.now()
        self.save()

    class Meta:
        ordering = ('-publish',)

    def __str__(self):
        return self.title

# https://docs.djangoproject.com/en/2.2/ref/models/fields/#field-types



# by NPA
class Comment(models.Model):
    post = models.ForeignKey('appblog.Post', on_delete=models.CASCADE, related_name='comments')
    author = models.CharField(max_length=200, verbose_name="Autor")
    text = models.TextField(verbose_name="Comentario")
    # created_date = models.DateTimeField(default=timezone.now)
    publish = models.DateTimeField(default=timezone.now)
    approved_comment = models.BooleanField(default=False)

    def approve(self):
        # if user.is_authenticated:
            self.approved_comment = True
            self.save()

    def __str__(self):
        return self.text


"""
slug: This is a field intended to be used in URLs.
          A slug is a short label that contains only letters, numbers, underscores, or hyphens.
          You will use the slug field to build beautiful, SEO-friendly URLs for your blog posts.
            You have added the unique_for_date parameter to this field so that you can build URLs for posts using their publish date and slug.
            Django will prevent multiple posts from having the same slug for a given date.
"""
