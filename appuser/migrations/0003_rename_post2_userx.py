# Generated by Django 3.2.9 on 2021-12-18 12:50

from django.conf import settings
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('appuser', '0002_remove_post2_title'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='Post2',
            new_name='Userx',
        ),
    ]
