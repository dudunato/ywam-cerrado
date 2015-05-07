# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('demo', '0005_courseindexpage_body'),
    ]

    operations = [
        migrations.AddField(
            model_name='coursepage',
            name='languages',
            field=models.CharField(default=datetime.datetime(2015, 5, 2, 20, 22, 38, 837996, tzinfo=utc), max_length=255),
            preserve_default=False,
        ),
    ]
