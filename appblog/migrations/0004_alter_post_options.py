# Generated by Django 3.2.9 on 2021-12-18 12:13

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('appblog', '0003_auto_20211216_1945'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='post',
            options={'ordering': ('-created',)},
        ),
    ]