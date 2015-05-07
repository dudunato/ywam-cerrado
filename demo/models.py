from datetime import date

from django.db import models
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.http import HttpResponse, HttpResponseRedirect
from django.utils import translation

from wagtail.wagtailcore.models import Page, Orderable
from wagtail.wagtailcore.fields import RichTextField
from wagtail.wagtailadmin.edit_handlers import FieldPanel, MultiFieldPanel, \
    InlinePanel, PageChooserPanel
from wagtail.wagtailimages.edit_handlers import ImageChooserPanel
from wagtail.wagtaildocs.edit_handlers import DocumentChooserPanel
from wagtail.wagtailsnippets.models import register_snippet
from wagtail.wagtailforms.models import AbstractEmailForm, AbstractFormField
from wagtail.wagtailsearch import index

from modelcluster.fields import ParentalKey
from modelcluster.tags import ClusterTaggableManager
from taggit.models import TaggedItemBase

from demo.utils import export_event


EVENT_AUDIENCE_CHOICES = (
    ('public', "Public"),
    ('private', "Private"),
)


# multilingual support
class LanguageRedirectionPage(Page):

    def serve(self, request):
        # This will only return a language that
        # is in the LANGUAGES Django setting
        language = translation.get_language_from_request(request)
        language = language if language == 'en' else 'br'

        return HttpResponseRedirect(self.url + language + '/')


class TranslatablePageMixin(models.Model):
    # One link for each alternative language
    # These should only be used on the main language page (english)
    br_link = models.ForeignKey(
        Page,
        null=True,
        on_delete=models.SET_NULL,
        blank=True,
        related_name='+')

    def get_language(self):
        """
        This returns the language code for this page.
        """
        # Look through ancestors of this page for its language homepage
        # The language homepage is located at depth 3
        language_homepage = self.get_ancestors(inclusive=True).get(depth=3)

        # The slug of language homepages should always 
        # be set to the language code
        return language_homepage.slug

    # Method to find the main language version of this page
    # This works by reversing the above links
    def english_page(self):
        """
        This finds the english version of this page
        """
        language = self.get_language()

        if language == 'en':
            return self
        elif language == 'br':
            return type(self).objects.filter(br_link=self).first().specific

    # We need a method to find a version of this page for each 
    # alternative language.
    # These all work the same way. They firstly find the main version page
    # (english), then from there they can just follow the link to correct page.

    def br_page(self):
        """
        This finds the br version of this page
        """
        english_page = self.english_page()

        if english_page and english_page.br_link:
            return english_page.br_link.specific

    class Meta:
        abstract = True


# A couple of abstract classes that contain commonly used fields
class LinkFields(models.Model):
    link_external = models.URLField("External link", blank=True)
    link_page = models.ForeignKey(
        'wagtailcore.Page',
        null=True,
        blank=True,
        related_name='+'
    )
    link_document = models.ForeignKey(
        'wagtaildocs.Document',
        null=True,
        blank=True,
        related_name='+'
    )

    @property
    def link(self):
        if self.link_page:
            return self.link_page.url
        elif self.link_document:
            return self.link_document.url
        else:
            return self.link_external

    panels = [
        FieldPanel('link_external'),
        PageChooserPanel('link_page'),
        DocumentChooserPanel('link_document'),
    ]

    class Meta:
        abstract = True


class ContactFields(models.Model):
    telephone = models.CharField(max_length=20, blank=True)
    email = models.EmailField(blank=True)
    address_1 = models.CharField(max_length=255, blank=True)
    address_2 = models.CharField(max_length=255, blank=True)
    city = models.CharField(max_length=255, blank=True)
    country = models.CharField(max_length=255, blank=True)
    post_code = models.CharField(max_length=10, blank=True)

    panels = [
        FieldPanel('telephone'),
        FieldPanel('email'),
        FieldPanel('address_1'),
        FieldPanel('address_2'),
        FieldPanel('city'),
        FieldPanel('country'),
        FieldPanel('post_code'),
    ]

    class Meta:
        abstract = True


# Carousel items

class CarouselItem(LinkFields):
    image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
    embed_url = models.URLField("Embed URL", blank=True)
    caption = models.CharField(max_length=255, blank=True)

    panels = [
        ImageChooserPanel('image'),
        FieldPanel('embed_url'),
        FieldPanel('caption'),
        MultiFieldPanel(LinkFields.panels, "Link"),
    ]

    class Meta:
        abstract = True


# Related links

class RelatedLink(LinkFields):
    title = models.CharField(max_length=255, help_text="Link title")

    panels = [
        FieldPanel('title'),
        MultiFieldPanel(LinkFields.panels, "Link"),
    ]

    class Meta:
        abstract = True


# Advert Snippet

class AdvertPlacement(models.Model):
    page = ParentalKey('wagtailcore.Page', related_name='advert_placements')
    advert = models.ForeignKey('demo.Advert', related_name='+')


class Advert(models.Model):
    page = models.ForeignKey(
        'wagtailcore.Page',
        related_name='adverts',
        null=True,
        blank=True
    )
    url = models.URLField(null=True, blank=True)
    text = models.CharField(max_length=255)

    panels = [
        PageChooserPanel('page'),
        FieldPanel('url'),
        FieldPanel('text'),
    ]

    def __unicode__(self):
        return self.text

register_snippet(Advert)


# Home Page

class HomePageCarouselItem(Orderable, CarouselItem):
    page = ParentalKey('demo.HomePage', related_name='carousel_items')


class HomePageRelatedLink(Orderable, RelatedLink):
    page = ParentalKey('demo.HomePage', related_name='related_links')


class HomePage(Page, TranslatablePageMixin):
    slogan = models.CharField(max_length=255, blank=True, default="")
    body = RichTextField(blank=True)

    search_fields = Page.search_fields + (
        index.SearchField('body'),
    )

    class Meta:
        verbose_name = "Homepage"

HomePage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('slogan', classname="full"),
    FieldPanel('body', classname="full"),
    InlinePanel(HomePage, 'carousel_items', label="Carousel items"),
    InlinePanel(HomePage, 'related_links', label="Related links"),
    PageChooserPanel('br_link'),
]

HomePage.promote_panels = Page.promote_panels


# Standard index page

class StandardIndexPageRelatedLink(Orderable, RelatedLink):
    page = ParentalKey('demo.StandardIndexPage', related_name='related_links')


class StandardIndexPage(Page, TranslatablePageMixin):
    intro = RichTextField(blank=True)
    feed_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )

    search_fields = Page.search_fields + (
        index.SearchField('intro'),
    )

StandardIndexPage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('intro', classname="full"),
    InlinePanel(StandardIndexPage, 'related_links', label="Related links"),
]

StandardIndexPage.promote_panels = Page.promote_panels + [
    ImageChooserPanel('feed_image'),
]


# Standard page

class StandardPageCarouselItem(Orderable, CarouselItem):
    page = ParentalKey('demo.StandardPage', related_name='carousel_items')


class StandardPageRelatedLink(Orderable, RelatedLink):
    page = ParentalKey('demo.StandardPage', related_name='related_links')


class StandardPage(Page, TranslatablePageMixin):
    intro = RichTextField(blank=True)
    body = RichTextField(blank=True)
    feed_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )

    search_fields = Page.search_fields + (
        index.SearchField('intro'),
        index.SearchField('body'),
    )

StandardPage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('intro', classname="full"),
    InlinePanel(StandardPage, 'carousel_items', label="Carousel items"),
    FieldPanel('body', classname="full"),
    InlinePanel(StandardPage, 'related_links', label="Related links"),
]

StandardPage.promote_panels = Page.promote_panels + [
    ImageChooserPanel('feed_image'),
]


# Blog index page

class BlogIndexPageRelatedLink(Orderable, RelatedLink):
    page = ParentalKey('demo.BlogIndexPage', related_name='related_links')


class BlogIndexPage(Page, TranslatablePageMixin):
    intro = RichTextField(blank=True)

    search_fields = Page.search_fields + (
        index.SearchField('intro'),
    )

    @property
    def blogs(self):
        # Get list of live blog pages that are descendants of this page
        blogs = BlogPage.objects.live().descendant_of(self)

        # Order by most recent date first
        blogs = blogs.order_by('-date')

        return blogs

    def get_context(self, request):
        # Get blogs
        blogs = self.blogs

        # Filter by tag
        tag = request.GET.get('tag')
        if tag:
            blogs = blogs.filter(tags__name=tag)

        # Pagination
        page = request.GET.get('page')
        paginator = Paginator(blogs, 10)  # Show 10 blogs per page
        try:
            blogs = paginator.page(page)
        except PageNotAnInteger:
            blogs = paginator.page(1)
        except EmptyPage:
            blogs = paginator.page(paginator.num_pages)

        # Update template context
        context = super(BlogIndexPage, self).get_context(request)
        context['blogs'] = blogs
        return context

BlogIndexPage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('intro', classname="full"),
    InlinePanel(BlogIndexPage, 'related_links', label="Related links"),
]

BlogIndexPage.promote_panels = Page.promote_panels


# Blog page

class BlogPageCarouselItem(Orderable, CarouselItem):
    page = ParentalKey('demo.BlogPage', related_name='carousel_items')


class BlogPageRelatedLink(Orderable, RelatedLink):
    page = ParentalKey('demo.BlogPage', related_name='related_links')


class BlogPageTag(TaggedItemBase):
    content_object = ParentalKey('demo.BlogPage', related_name='tagged_items')


class BlogPage(Page, TranslatablePageMixin):
    body = RichTextField()
    tags = ClusterTaggableManager(through=BlogPageTag, blank=True)
    date = models.DateField("Post date")
    feed_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )

    search_fields = Page.search_fields + (
        index.SearchField('body'),
    )

    @property
    def blog_index(self):
        # Find closest ancestor which is a blog index
        return self.get_ancestors().type(BlogIndexPage).last()

BlogPage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('date'),
    FieldPanel('body', classname="full"),
    InlinePanel(BlogPage, 'carousel_items', label="Carousel items"),
    InlinePanel(BlogPage, 'related_links', label="Related links"),
]

BlogPage.promote_panels = Page.promote_panels + [
    ImageChooserPanel('feed_image'),
    FieldPanel('tags'),
]


# Person page

class PersonPageRelatedLink(Orderable, RelatedLink):
    page = ParentalKey('demo.PersonPage', related_name='related_links')


class PersonPage(Page, ContactFields, TranslatablePageMixin):
    first_name = models.CharField(max_length=255)
    last_name = models.CharField(max_length=255)
    intro = RichTextField(blank=True)
    biography = RichTextField(blank=True)
    image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
    feed_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )

    search_fields = Page.search_fields + (
        index.SearchField('first_name'),
        index.SearchField('last_name'),
        index.SearchField('intro'),
        index.SearchField('biography'),
    )

PersonPage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('first_name'),
    FieldPanel('last_name'),
    FieldPanel('intro', classname="full"),
    FieldPanel('biography', classname="full"),
    ImageChooserPanel('image'),
    MultiFieldPanel(ContactFields.panels, "Contact"),
    InlinePanel(PersonPage, 'related_links', label="Related links"),
]

PersonPage.promote_panels = Page.promote_panels + [
    ImageChooserPanel('feed_image'),
]


# Contact page

class ContactPage(Page, ContactFields, TranslatablePageMixin):
    body = RichTextField(blank=True)
    feed_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )

    search_fields = Page.search_fields + (
        index.SearchField('body'),
    )

ContactPage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('body', classname="full"),
    MultiFieldPanel(ContactFields.panels, "Contact"),
]

ContactPage.promote_panels = Page.promote_panels + [
    ImageChooserPanel('feed_image'),
]


# Event index page

class EventIndexPageRelatedLink(Orderable, RelatedLink):
    page = ParentalKey('demo.EventIndexPage', related_name='related_links')


class EventIndexPage(Page, TranslatablePageMixin):
    intro = RichTextField(blank=True)

    search_fields = Page.search_fields + (
        index.SearchField('intro'),
    )

    @property
    def events(self):
        # Get list of live event pages that are descendants of this page
        events = EventPage.objects.live().descendant_of(self)

        # Filter events list to get ones that are either
        # running now or start in the future
        events = events.filter(date_from__gte=date.today())

        # Order by date
        events = events.order_by('date_from')

        return events

EventIndexPage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('intro', classname="full"),
    InlinePanel(EventIndexPage, 'related_links', label="Related links"),
]

EventIndexPage.promote_panels = Page.promote_panels


# Event page

class EventPageCarouselItem(Orderable, CarouselItem):
    page = ParentalKey('demo.EventPage', related_name='carousel_items')


class EventPageRelatedLink(Orderable, RelatedLink):
    page = ParentalKey('demo.EventPage', related_name='related_links')


class EventPageSpeaker(Orderable, LinkFields):
    page = ParentalKey('demo.EventPage', related_name='speakers')
    first_name = models.CharField("Name", max_length=255, blank=True)
    last_name = models.CharField("Surname", max_length=255, blank=True)
    image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )

    @property
    def name_display(self):
        return self.first_name + " " + self.last_name

    panels = [
        FieldPanel('first_name'),
        FieldPanel('last_name'),
        ImageChooserPanel('image'),
        MultiFieldPanel(LinkFields.panels, "Link"),
    ]


class EventPage(Page, TranslatablePageMixin):
    date_from = models.DateField("Start date")
    date_to = models.DateField(
        "End date",
        null=True,
        blank=True,
        help_text="Not required if event is on a single day"
    )
    time_from = models.TimeField("Start time", null=True, blank=True)
    time_to = models.TimeField("End time", null=True, blank=True)
    audience = models.CharField(max_length=255, choices=EVENT_AUDIENCE_CHOICES)
    location = models.CharField(max_length=255)
    body = RichTextField(blank=True)
    cost = models.CharField(max_length=255)
    signup_link = models.URLField(blank=True)
    feed_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )

    search_fields = Page.search_fields + (
        index.SearchField('get_audience_display'),
        index.SearchField('location'),
        index.SearchField('body'),
    )

    @property
    def event_index(self):
        # Find closest ancestor which is an event index
        return self.get_ancestors().type(EventIndexPage).last()

    def serve(self, request):
        if "format" in request.GET:
            if request.GET['format'] == 'ical':
                # Export to ical format
                response = HttpResponse(
                    export_event(self, 'ical'),
                    content_type='text/calendar',
                )
                response['Content-Disposition'] = 'attachment; filename=' + self.slug + '.ics'
                return response
            else:
                # Unrecognised format error
                message = 'Could not export event\n\nUnrecognised format: ' + request.GET['format']
                return HttpResponse(message, content_type='text/plain')
        else:
            # Display event page as usual
            return super(EventPage, self).serve(request)

EventPage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('date_from'),
    FieldPanel('date_to'),
    FieldPanel('time_from'),
    FieldPanel('time_to'),
    FieldPanel('location'),
    FieldPanel('audience'),
    FieldPanel('cost'),
    FieldPanel('signup_link'),
    InlinePanel(EventPage, 'carousel_items', label="Carousel items"),
    FieldPanel('body', classname="full"),
    InlinePanel(EventPage, 'speakers', label="Speakers"),
    InlinePanel(EventPage, 'related_links', label="Related links"),
]

EventPage.promote_panels = Page.promote_panels + [
    ImageChooserPanel('feed_image'),
]


# course pages
class CourseIndexPageRelatedLink(Orderable, RelatedLink):
    page = ParentalKey('demo.CourseIndexPage', related_name='related_links')


class CourseIndexPage(Page, TranslatablePageMixin):
    intro = RichTextField(blank=True)
    header_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
    body = RichTextField(blank=True)

    search_fields = Page.search_fields + (
        index.SearchField('intro'),
    )

    @property
    def courses(self):
        courses = CoursePage.objects.live().descendant_of(self)
        courses = courses.filter(date_from__gte=date.today())
        courses = courses.order_by('date_from')

        return courses

CourseIndexPage.content_panels = [
    FieldPanel('title', classname="full title"),
    ImageChooserPanel('header_image'),
    FieldPanel('intro', classname="full"),
    FieldPanel('body', classname="full"),
    InlinePanel(CourseIndexPage, 'related_links', label="Related links"),
]

CourseIndexPage.promote_panels = Page.promote_panels


class CoursePageRelatedLink(Orderable, RelatedLink):
    page = ParentalKey('demo.CoursePage', related_name='related_links')


class CoursePage(Page, TranslatablePageMixin):
    date_from = models.DateField("Start date")
    body = RichTextField(blank=True)
    languages = models.CharField(max_length=255)
    cost_lecture = models.CharField(max_length=255)
    cost_outreach = models.CharField(max_length=255)
    signup_link = models.URLField(blank=True)
    feed_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
    header_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )

    search_fields = Page.search_fields + (
        index.SearchField('body'),
    )

    @property
    def course_index(self):
        # Find closest ancestor which is an event index
        return self.get_ancestors().type(CourseIndexPage).last()

CoursePage.content_panels = [
    FieldPanel('title', classname="full title"),
    ImageChooserPanel('header_image'),
    FieldPanel('date_from'),
    FieldPanel('languages'),
    FieldPanel('cost_lecture'),
    FieldPanel('cost_outreach'),
    FieldPanel('signup_link'),
    FieldPanel('body', classname="full"),
    InlinePanel(CoursePage, 'related_links', label="Related links"),
]

CoursePage.promote_panels = Page.promote_panels + [
    ImageChooserPanel('feed_image'),
]


class FormField(AbstractFormField):
    page = ParentalKey('FormPage', related_name='form_fields')


class FormPage(AbstractEmailForm):
    intro = RichTextField(blank=True)
    thank_you_text = RichTextField(blank=True)

FormPage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('intro', classname="full"),
    InlinePanel(FormPage, 'form_fields', label="Form fields"),
    FieldPanel('thank_you_text', classname="full"),
    MultiFieldPanel([
        FieldPanel('to_address', classname="full"),
        FieldPanel('from_address', classname="full"),
        FieldPanel('subject', classname="full"),
    ], "Email")
]
