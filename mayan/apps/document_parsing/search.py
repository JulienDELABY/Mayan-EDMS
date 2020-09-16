from django.utils.translation import ugettext_lazy as _

from mayan.apps.documents.search import (
    document_file_page_search, document_search
)

document_file_page_search.add_model_field(
    field='content__content', label=_('Content')
)

document_search.add_model_field(
    field='files__file_pages__content__content', label=_('Content')
)
