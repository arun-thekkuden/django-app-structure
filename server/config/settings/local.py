from .base import *  # noqa


DEBUG = True

ALLOWED_HOSTS = ["*"]

# Database
# https://docs.djangoproject.com/en/2.0/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': env('DJANGO_DB_NAME', default='postgres'),
        'HOST': env('DJANGO_DB_HOST', default='db'),
        'USER': env('DJANGO_DB_USER', default='postgres'),
        'PORT': env('DJANGO_DB_PORT', default='5432'),
        'PASSWORD': env('DJANGO_DB_PASSWORD', default=None),
        'ATOMIC_REQUESTS': True,
    },
}


# Password validation
# https://docs.djangoproject.com/en/2.0/ref/settings/#auth-password-validators
# Setting this to empty list, to have easy passwords in dev environments
AUTH_PASSWORD_VALIDATORS = []
