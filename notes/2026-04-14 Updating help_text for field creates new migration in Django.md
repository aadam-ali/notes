---
title: Updating `help_text` for field creates new migration in Django
date: 2026-04-14
---
Given the following model, running `python manage.py makemigrations`
generates a migration that creates a table for the book model.

```python
from django.db import models

class Book(models.Model):
    title = models.CharField(max_length=200)
    pub_date = models.DateTimeField("date published")
```

Updating the `title` field to include the `help_text` argument (or
updating the value of it where it already exists) and running `python
manage.py makemigrations` results in a second migration that updates the
help text.

```python
    title = models.CharField(max_length=200, help_text="Title of the published book")
```

We can confirm this change doesn't modify the database table by running
`python manage.py sqlmigrate <app> <migration>` against the new
migration, which returns:

```sql
BEGIN;
--
-- Alter field title on book
--
-- (no-op)
COMMIT;
```

Unless database engines that aren't SQLite or PostgreSQL use
`help_text`, this change is only cosmetic. In fact, you can make the
change without generating and running the migrations and the updated
value will be visible in the admin console.

Related:
- <https://code.djangoproject.com/ticket/21498>
- <https://docs.djangoproject.com/en/5.2/topics/migrations/#squashing-migrations>
- <https://stackoverflow.com/questions/26503826/why-does-django-make-migrations-for-help-text-and-verbose-name-changes>
