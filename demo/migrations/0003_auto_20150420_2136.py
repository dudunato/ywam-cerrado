# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('wagtailcore', '0010_change_page_owner_to_null_on_delete'),
        ('demo', '0002_homepage_slogan'),
    ]

    operations = [
        migrations.CreateModel(
            name='LanguageRedirectionPage',
            fields=[
                ('page_ptr', models.OneToOneField(parent_link=True, auto_created=True, primary_key=True, serialize=False, to='wagtailcore.Page')),
            ],
            options={
                'abstract': False,
            },
            bases=('wagtailcore.page',),
        ),
        migrations.AddField(
            model_name='blogindexpage',
            name='br_link',
            field=models.ForeignKey(related_name='+', on_delete=django.db.models.deletion.SET_NULL, blank=True, to='wagtailcore.Page', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='blogpage',
            name='br_link',
            field=models.ForeignKey(related_name='+', on_delete=django.db.models.deletion.SET_NULL, blank=True, to='wagtailcore.Page', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='contactpage',
            name='br_link',
            field=models.ForeignKey(related_name='+', on_delete=django.db.models.deletion.SET_NULL, blank=True, to='wagtailcore.Page', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='eventindexpage',
            name='br_link',
            field=models.ForeignKey(related_name='+', on_delete=django.db.models.deletion.SET_NULL, blank=True, to='wagtailcore.Page', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='eventpage',
            name='br_link',
            field=models.ForeignKey(related_name='+', on_delete=django.db.models.deletion.SET_NULL, blank=True, to='wagtailcore.Page', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='homepage',
            name='br_link',
            field=models.ForeignKey(related_name='+', on_delete=django.db.models.deletion.SET_NULL, blank=True, to='wagtailcore.Page', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='personpage',
            name='br_link',
            field=models.ForeignKey(related_name='+', on_delete=django.db.models.deletion.SET_NULL, blank=True, to='wagtailcore.Page', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='standardindexpage',
            name='br_link',
            field=models.ForeignKey(related_name='+', on_delete=django.db.models.deletion.SET_NULL, blank=True, to='wagtailcore.Page', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='standardpage',
            name='br_link',
            field=models.ForeignKey(related_name='+', on_delete=django.db.models.deletion.SET_NULL, blank=True, to='wagtailcore.Page', null=True),
            preserve_default=True,
        ),
    ]
