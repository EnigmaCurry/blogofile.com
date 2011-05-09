.. _config-file:

Config File
===========

Blogofile looks for a file called ``_config.py`` in the root of your
source directory -- this is your site's main configuration
file. Blogofile tries to use sensible default values for anything you
don't configure explicitly in this file. Although every site must have
a ``_config.py``, it can start out completely blank.

Default Values
--------------

Blogofile ships with it's own default configuration file, which is
separate from your site's own ``_config.py``. You should never edit
this file yourself, rather you should redefine any values for your
site in your own ``_config.py`` at the root of your site's source
directory.

It is sometimes useful to reference the default configuration file so
you know what the default values are. You can see where this file is
located on your computer by running::

    blogofile info

This will print some information about your personal Blogofile
installation. Among this info, is what version of Blogofile you're
running, where it's installed, what version of Python you're running,
and for our immediate purposes, where the default Blogofile configuration
file is located.

The default configuration file is loaded first, before any user
``_config.py`` is loaded. This way your own ``_config.py`` inherits
all the default values (until you redefine them), which is also why
your own ``_config.py`` can start out completely blank.

Context of _config.py
---------------------

``_config.py`` is run within a context that is prepared by Blogofile
before executing. This context includes the following prepared objects:

* **controllers** - Settings for :ref:`controllers`.
* **filters** - Settings for :ref:`filters`.
* **templates** - Settings for :ref:`templates`.
* **plugins** - Settings for :ref:`plugins`.
* **site** - General settings pertaining to your entire site, eg: site.url.

All of these are instances of the `HierarchicalCache`_
class. `HierarchicalCache`_ objects behave a bit differently than
typical Python objects: accessed attributes that do not exist, do not
raise an `AttributeError`_. Instead, they instantiate the non-existing
attribute as a nested `HierarchicalCache`_ object and return that.

This style of configuration gives Blogofile a free-form declarative
syntax which provides a separate namespace for each feature of your
Blogofile site. An important reason for this free-form syntax is that
it allows you to retain configuration settings for features that may
or may not be currently installed, without raising an error. For
example, your ``_config.py`` might have the following setting for a
photo gallery controller::

  controllers.photo_gallery.albums.photos_per_page = 5

In this example, ``controllers``, ``photo_gallery``, and ``albums``,
are all instances of `HierarchicalCache`_. ``photos_per_page`` is an
integer (5) that is an attribute on the ``albums``
`HierarchicalCache`_.  Because this setting is contained in a
`HierarchicalCache`_ object, if the photo gallery controller is not
installed, the setting will simply be ignored.

Let's discuss the ``site`` object first, the rest of the prepared
objects will be introduced separately in their own chapters.

Site Configuration
------------------

As mentioned above, one of the prepared objects in ``_config.py`` is
called ``site``. This object holds attributes and settings that
pertain to your entire site. Even if your site is primarily used as a
blog, think of ``site`` as the parent of the blog.

To reiterate the nature of the ``site`` object: ``site`` is a
`HierarchicalCache`_ object, so you can define whatever attributes and
settings make sense for your site::

    site.my_group.my_setting = "My Setting"

Here is a comprehensive list of the ones that Blogofile defines by
default:
    
.. _config-site-url:

site.url
++++++++
String - default ``"http://www.example.com"``

This is the root URL for your website. This is the URL that your blogofile site will be hosted at::

    site.url = "http://www.example.com"

.. _config-file-ignore-patterns:


site.author
+++++++++++
String - default ``None``

This is your name, the author of the site. This is completely
optional, some :ref:`Plugins` may choose to refer to this
variable. For instance the ``simple_blog`` templates refer to this to
create a meta tag identifying the author of the site::

    site.author = "John Smith"

site.overwrite_warning
++++++++++++++++++++++
Boolean - default ``True``

By setting this flag, a warning message will display whenever a file
in the ``_site`` directory is written more than once during a
build. This happens for instance when two controllers are fighting
over writing to a single file, and the warning message will help you
track down the problem::

    site.ovewrite_warning = True
    
site.file_ignore_patterns
+++++++++++++++++++++++++
List

This is a list of regular expressions that describe paths to ignore
when processing your source directory. Any file that you don't want to
have copied to your ``_site`` directory when you build your site has
to match one of these rules. The most important one (and one you
should not remove) is ``".*/_.*"`` which ignores all files and
directories that start with an underscore (like ``_config.py`` and
``_posts``)::

    site.file_ignore_patterns = [
        # All files that start with an underscore
        ".*/_.*",
        # Emacs autosave files
        ".*/#.*",
        # Emacs/Vim temporary files
        ".*~$",
        # Vim swap files
        ".*/\..*\.swp$",
        # VCS directories
        ".*/\.(git|hg|svn|bzr)$",
        # Git and Mercurial ignored files definitions
        ".*/.(git|hg)ignore$",
        # CVS dir
        ".*/CVS$",
        ]

site.base_template
++++++++++++++++++
String - default ``"site.mako"``

This is the base :ref:`template <templates>` of your site, which
should be a file in your ``_templates`` directory. Although each
template can define whatever base template it wants, this is used in
the case of combining multiple template types in one site. For
instance, you can have a base template written in Mako, and render a
template file written in Jinja2 and you can have Jinja2 inherit from
your base Mako template through this setting. Refer to
:ref:`templates` for more information::

    site.base_template = "site.mako"

site.use_hard_links
+++++++++++++++++++
Boolean - default ``False``

By setting this flag, static files will not be copied to your
``_site`` directory, rather they will be hard linked from your source
directory. This can be useful if you have a lot of static files that
you want to serve and you want to avoid the cost of copying them each
time you build. However, you probably should seriously consider
hosting those files separately if possible. Setting this to ``True``
is usually wrong, unless you know what you're doing::

    site.use_hard_links = False


Build Hooks
-----------

A few functions can also be defined in your ``_config.py`` which are
callbacks used under certain build conditions.

.. _config-pre-build:

pre_build
+++++++++
Function

This is a function that gets run before the ``_site`` directory is built

.. _config-post-build:

post_build
++++++++++
Function

This is a function that gets run after the ``_site`` directory is
successfully built. :ref:`config-build-finally` is called directly after this.

.. _config-build-exception:

build_exception
+++++++++++++++
Function

This is a function that gets run if a fatal error occurs, and the
``_site`` directory is left in an unfinished build
state. :ref:`config-build-finally` is called directly after this.

.. _config-build-finally:

build_finally
+++++++++++++
Function

This is a function that gets run after the ``_site`` directory is
built successfully (after :ref:`config-post-build`) **OR** whenever a fatal
error occurs (after :ref:`config-build-exception`).

    
.. _HierarchicalCache: http://github.com/EnigmaCurry/blogofile/blob/master/blogofile/cache.py#L22

.. _AttributeError: http://docs.python.org/library/exceptions.html#exceptions.AttributeError
