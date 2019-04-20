from __future__ import absolute_import, unicode_literals

from json import dumps

from django.conf import settings
from django.contrib import messages
from django.contrib.contenttypes.models import ContentType
from django.http import HttpResponseRedirect
from django.shortcuts import get_object_or_404, resolve_url
from django.template import RequestContext
from django.urls import reverse_lazy
from django.utils import timezone, translation
from django.utils.http import urlencode
from django.utils.translation import ugettext_lazy as _
from django.views.generic import RedirectView, TemplateView

from mayan.apps.acls.models import AccessControlList

from .exceptions import NotLatestVersion, UnknownLatestVersion
from .forms import (
    LicenseForm, LocaleProfileForm, LocaleProfileForm_view,
    PackagesLicensesForm
)
from .generics import (  # NOQA
    AssignRemoveView, ConfirmView, FormView, MultiFormView,
    MultipleObjectConfirmActionView, MultipleObjectFormActionView,
    SingleObjectCreateView, SingleObjectDeleteView,
    SingleObjectDetailView, SingleObjectDynamicFormCreateView,
    SingleObjectDynamicFormEditView, SingleObjectDownloadView,
    SingleObjectEditView, SingleObjectListView, SimpleView
)
from .icons import icon_setup
from .menus import menu_tools, menu_setup
from .permissions_runtime import permission_error_log_view
from .settings import setting_home_view
from .utils import check_version


class AboutView(SimpleView):
    extra_context = {'title': _('About')}
    template_name = 'appearance/about.html'


class CheckVersionView(SimpleView):
    template_name = 'appearance/generic_template.html'

    def get_extra_context(self):
        try:
            check_version()
        except NotLatestVersion as exception:
            message = _(
                'The version you are using is outdated. The latest version '
                'is %s'
            ) % exception.upstream_version
        except UnknownLatestVersion:
            message = _(
                'It is not possible to determine the latest version '
                'available.'
            )
        else:
            message = _('Your version is up-to-date.')

        return {
            'title': _('Check for updates'),
            'content': message
        }


class CurrentUserLocaleProfileDetailsView(TemplateView):
    template_name = 'appearance/generic_form.html'

    def get_context_data(self, **kwargs):
        data = super(
            CurrentUserLocaleProfileDetailsView, self
        ).get_context_data(**kwargs)
        data.update({
            'form': LocaleProfileForm_view(
                instance=self.request.user.locale_profile
            ),
            'read_only': True,
            'title': _('Current user locale profile details'),
        })
        return data


class CurrentUserLocaleProfileEditView(SingleObjectEditView):
    extra_context = {
        'title': _('Edit current user locale profile details')
    }
    form_class = LocaleProfileForm
    post_action_redirect = reverse_lazy(
        'common:current_user_locale_profile_details'
    )

    def form_valid(self, form):
        form.save()

        timezone.activate(form.cleaned_data['timezone'])
        translation.activate(form.cleaned_data['language'])

        if hasattr(self.request, 'session'):
            self.request.session[
                translation.LANGUAGE_SESSION_KEY
            ] = form.cleaned_data['language']
            self.request.session[
                settings.TIMEZONE_SESSION_KEY
            ] = form.cleaned_data['timezone']
        else:
            self.request.set_cookie(
                settings.LANGUAGE_COOKIE_NAME, form.cleaned_data['language']
            )
            self.request.set_cookie(
                settings.TIMEZONE_COOKIE_NAME, form.cleaned_data['timezone']
            )

        return super(CurrentUserLocaleProfileEditView, self).form_valid(form)

    def get_object(self):
        return self.request.user.locale_profile


class FaviconRedirectView(RedirectView):
    permanent = True

    def get_redirect_url(self, *args, **kwargs):
        """
        Hide the static tag import to avoid errors with static file
        processors
        """
        from django.contrib.staticfiles.templatetags.staticfiles import static
        return static('appearance/images/favicon.ico')


class HomeView(SimpleView):
    extra_context = {
        'title': _('Dashboard'),
    }
    template_name = 'appearance/home.html'


class LicenseView(SimpleView):
    extra_context = {
        'form': LicenseForm(),
        'read_only': True,
        'title': _('License'),
    }
    template_name = 'appearance/generic_form.html'


class ObjectErrorLogEntryListClearView(ConfirmView):
    def get_extra_context(self):
        return {
            'object': self.get_object(),
            'title': _('Clear error log entries for: %s' % self.get_object()),
        }

    def get_object(self):
        content_type = get_object_or_404(
            klass=ContentType, app_label=self.kwargs['app_label'],
            model=self.kwargs['model']
        )

        return get_object_or_404(
            klass=content_type.model_class(),
            pk=self.kwargs['object_id']
        )

    def view_action(self):
        self.get_object().error_logs.all().delete()
        messages.success(
            message=_('Object error log cleared successfully'),
            request=self.request
        )


class ObjectErrorLogEntryListView(SingleObjectListView):
    def dispatch(self, request, *args, **kwargs):
        AccessControlList.objects.check_access(
            obj=self.get_object(), permissions=permission_error_log_view,
            user=request.user
        )

        return super(ObjectErrorLogEntryListView, self).dispatch(
            request, *args, **kwargs
        )

    def get_extra_context(self):
        return {
            'extra_columns': (
                {'name': _('Date and time'), 'attribute': 'datetime'},
                {'name': _('Result'), 'attribute': 'result'},
            ),
            'hide_object': True,
            'object': self.get_object(),
            'title': _('Error log entries for: %s' % self.get_object()),
        }

    def get_object(self):
        content_type = get_object_or_404(
            klass=ContentType, app_label=self.kwargs['app_label'],
            model=self.kwargs['model']
        )

        return get_object_or_404(
            klass=content_type.model_class(), pk=self.kwargs['object_id']
        )

    def get_object_list(self):
        return self.get_object().error_logs.all()


class PackagesLicensesView(SimpleView):
    template_name = 'appearance/generic_form.html'

    def get_extra_context(self):
        # Use a function so that PackagesLicensesForm get initialized at every
        # request
        return {
            'form': PackagesLicensesForm(),
            'read_only': True,
            'title': _('Other packages licenses'),
        }


class RootView(SimpleView):
    extra_context = {'home_view': setting_home_view.value}
    template_name = 'appearance/root.html'


class SetupListView(TemplateView):
    template_name = 'appearance/generic_list_horizontal.html'

    def get_context_data(self, **kwargs):
        data = super(SetupListView, self).get_context_data(**kwargs)
        context = RequestContext(self.request)
        context['request'] = self.request
        data.update(
            {
                'no_results_icon': icon_setup,
                'no_results_label': _('No setup options available.'),
                'no_results_text': _(
                    'No results here means that don\'t have the required '
                    'permissions to perform administrative task.'
                ),
                'resolved_links': menu_setup.resolve(context=context),
                'title': _('Setup items'),
            }
        )
        return data


class ToolsListView(SimpleView):
    template_name = 'appearance/generic_list_horizontal.html'

    def get_menu_links(self):
        context = RequestContext(self.request)
        context['request'] = self.request

        return menu_tools.resolve(context=context)

    def get_extra_context(self):
        return {
            'resolved_links': self.get_menu_links(),
            'title': _('Tools'),
        }


def multi_object_action_view(request):
    """
    Proxy view called first when using a multi object action, which
    then redirects to the appropiate specialized view
    """
    next = request.POST.get(
        'next', request.GET.get(
            'next', request.META.get(
                'HTTP_REFERER', resolve_url(settings.LOGIN_REDIRECT_URL)
            )
        )
    )

    action = request.GET.get('action', None)
    id_list = ','.join(
        [key[3:] for key in request.GET.keys() if key.startswith('pk_')]
    )
    items_property_list = [
        (key[11:]) for key in request.GET.keys() if key.startswith('properties_')
    ]

    if not action:
        messages.error(
            message=_('No action selected.'), request=request
        )
        return HttpResponseRedirect(
            request.META.get(
                'HTTP_REFERER', resolve_url(settings.LOGIN_REDIRECT_URL)
            )
        )

    if not id_list and not items_property_list:
        messages.error(
            message=_('Must select at least one item.'),
            request=request
        )
        return HttpResponseRedirect(
            request.META.get(
                'HTTP_REFERER', resolve_url(settings.LOGIN_REDIRECT_URL)
            )
        )

    # Separate redirects to keep backwards compatibility with older
    # functions that don't expect a properties_list parameter
    if items_property_list:
        return HttpResponseRedirect(
            '%s?%s' % (
                action,
                urlencode(
                    {
                        'items_property_list': dumps(items_property_list),
                        'next': next
                    }
                )
            )
        )
    else:
        return HttpResponseRedirect('%s?%s' % (
            action,
            urlencode({'id_list': id_list, 'next': next}))
        )
