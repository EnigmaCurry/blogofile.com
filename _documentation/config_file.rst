.. _config-file:

Configuration File
==================

This is a list of all the predefined values inside of _config.py (See :ref:`basic-configuration`).

The config file is just regular Python code, so you can define any additional values you want. All attributes are accessible inside your templates via ``${config.your_attribute}``. 

Basic Settings
--------------

.. _config-site-url:

site_url
++++++++
String

This is the full URL to your blogofile powered site. 

example: ``http://www.xkcd.com``

Include the path if your site is not at the root of the domain.

example: ``http://www.xkcd.com/~username``

The site_url corresponds with the contents of the ``_site`` directory, which does not necessarily have to be the root of your blog, which is controlled via the :ref:`config-blog-path` setting.

.. _config-blog-enabled:

blog_enabled
++++++++++++
      
Boolean  

This turns on/off the blog feature. Blogofile is obviously geared toward sites that have blogs, but you don't *need* to have one. Note that if set to True blogofile requires several blog specific templates to exist in the **_templates** directory as described in :ref:`required-templates`

Defaults to True

.. _config-blog-path:

blog_path
+++++++++

String

This is the path relative to the ``_site`` directory (as well as :ref:`config-site-url`) that your blog should reside. If you set this as ``/`` or blank, it will place the blog directly in the ``_site`` directory.

example: ``/blog``

.. _config-blog-name:

blog_name
+++++++++
String  

This is the name of your blog.

example: ``xkcd - The blag of the webcomic``

.. _config-blog-description:

blog_description
++++++++++++++++
String

This is a (short) description of your blog. Many RSS readers support/expect a description for feeds.

example: ``A Webcomic of Romance, Sarcasm, Math, and Language``


.. _config-blog-timezone:

blog_timezone
+++++++++++++
String

This is the `timezone`_ that you normally post to your blog from. 

Defaults to ``US/Eastern``

.. _config-blog-posts-per-page:

blog_posts_per_page
+++++++++++++++++++
Integer

This is the number of blog posts you want to display per page.

.. _config-blog-auto-permalink-enabled:

blog_auto_permalink_enabled
+++++++++++++++++++++++++++
Boolean

This turns on automatic permalink generation. If your post does not include a permalink field, then this allows for the automatic generation of the permalink.

.. _config-blog-auto-permalink:

blog_auto_permalink
+++++++++++++++++++
String

This is the format that automatic permalinks should take on, starting with the path after the blog domain name. eg: ``/blag/:year/:month/:day/:title`` creates a permalink like ``http://www.xkcd.com/blag/2009/08/18/post-one``.

Available replaceable items in the string:

 * :year - The post year
 * :title - The post title
 * :uuid - sha hash based on title
 * :filename - the filename of the post (minux extension)

Defaults to ``/blog/:year/:month/:day/:title``

Intermediate Settings
---------------------

.. _config-disqus-enabled:

disqus_enabled
++++++++++++++
Boolean

Turns on/off `Disqus`_ comment system integration.

Defaults to False

.. _config-disqus-name:

disqus_name
+++++++++++
String 

The Disqus website 'short name'

.. _config-syntax-highlight-enabled:

syntax_highlight_enabled
++++++++++++++++++++++++
Boolean

Turns on/off syntax highlighting of pre tags in blog posts.

Defaults to True

.. _config-syntax-highlight-style:

syntax_highlight_style
++++++++++++++++++++++
String

The default style to use for highlighting. See `Pygments Styles`_.

.. _config-custom-index:

blog_custom_index
+++++++++++++++++
Boolean

When you configure :ref:`config-blog-path`, Blogofile by default writes a chronological listing of the latest blog entries at that location. With this option you can turn that behaviour off and your index.html.mako file in that same location will be your own custom template. 

Defaults to False

.. _config-post-excerpt-enabled:

post_excerpt_enabled
++++++++++++++++++++
Boolean

Post objects have a .content attribute that contains the full content of the blog post. Some blogs choose to only show an excerpt of the post except for on the permalink page. If you turn this feature on, post objects will also have a .excerpt attribute that contains the first ``post_excerpt_word_length`` words.

If you don't use post excerpts, you can turn this off to decrease render times.

Defaults to True

.. _config-post-excerpt-word-length:

config-post-excerpt-word-length
+++++++++++++++++++++++++++++++
Integer

The number of words to have in post excerpts.

.. _config-blog-pagination-dir:

blog_pagination_dir
+++++++++++++++++++
String 

The name of the directory that contains more pages of posts than can be shown on the first page.

Defaults to ``page``, as in ``http://www.test.com/blog/page/4``

.. _config-emacs-orgmode-enabled:

emacs_orgmode_enabled
+++++++++++++++++++++
Boolean

Turns on/off org-mode templates for posts. You must have `Emacs`_ installed.

.. _config-emacs-binary:

emacs_binary
++++++++++++
String

The system path to your Emacs binary.

example: ``/usr/bin/emacs``

.. _config-emacs-preload-elisp:

emacs_preload_elisp
+++++++++++++++++++
String

Path to a file including environment settings for emacs to load on startup.

example: ``_emacs/setup.el``

.. _config-emacs-orgmode-preamble:

emacs_orgmode_preamble
++++++++++++++++++++++
String

Contents to add to an org mode preamble.

example: ``#+OPTIONS: H:3 num:nil toc:nil \n:nil``

Advanced Settings
------------------

.. _config-ignore-patterns:

ignore_patterns
+++++++++++++++
List

This is a list of regular expressions that describe paths to ignore when processing blogofile blogs. The most important one (and one you should not remove) is ``.*[\/]_.*`` which ignore all files and directories that start with an underscore (like _config.py and _posts)

.. _config-pre-build:

pre_build
+++++++++
Function

This is a function that gets run before the _site directory is built

.. _config-post-build:

post_build
++++++++++
Function

This is a function that gets run after the _site directory is built

.. only:: latex

   .. target-notes::
      :class: hidden

.. _timezone: http://en.wikipedia.org/wiki/List_of_zoneinfo_time_zones

.. _Disqus: http://www.disqus.com

.. _Pygments Styles: http://pygments.org/docs/styles

.. _Emacs: http://www.gnu.org/software/emacs
