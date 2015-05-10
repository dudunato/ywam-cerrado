# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('demo', '0010_standardindexpage_single_form'),
    ]

    operations = [
        migrations.AddField(
            model_name='coursepage',
            name='is_dts',
            field=models.BooleanField(default=False),
            preserve_default=True,
        ),
    ]
