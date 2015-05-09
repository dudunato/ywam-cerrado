# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('demo', '0009_standardindexpage_body'),
    ]

    operations = [
        migrations.AddField(
            model_name='standardindexpage',
            name='single_form',
            field=models.BooleanField(default=False),
            preserve_default=True,
        ),
    ]
