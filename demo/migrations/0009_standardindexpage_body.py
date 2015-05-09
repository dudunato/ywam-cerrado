# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import wagtail.wagtailcore.fields
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('demo', '0008_auto_20150509_0023'),
    ]

    operations = [
        migrations.AddField(
            model_name='standardindexpage',
            name='body',
            field=wagtail.wagtailcore.fields.RichTextField(default=datetime.datetime(2015, 5, 9, 16, 46, 11, 78459, tzinfo=utc), blank=True),
            preserve_default=False,
        ),
    ]
