# pages/templatetags/form_tags.py

from django import template

register = template.Library()


@register.filter(name='add_class')
def add_class(value, arg):
    if hasattr(value, 'as_widget'):
        return value.as_widget(attrs={'class': arg})
    return value


@register.filter(name='add_placeholder')
def add_placeholder(value, placeholder_text):
    if hasattr(value, 'as_widget'):
        return value.as_widget(attrs={'placeholder': placeholder_text})
    return value
