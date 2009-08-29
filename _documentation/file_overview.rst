The Makeup of a Blogofile Site
******************************
Blogofile is a website `compiler`_, but instead of translating something like C++ source code into an executable program, Blogofile takes `Mako`_ templates and other Blogofile features and compiles HTML for viewing in a web browser. This chapter describes the general makeup of a Blogofile directory containing such source code.

An Example
==========
The best way to understand how Blogofile works is to look at an example. You can checkout the source code for the main Blogofile.com website::

  blogofile init blogofile.com

The above command downloads the very latest blogofile.com website source code, which requires that you have `git`_ installed on your system. If you don't have it, you can just download the `zip file`_ instead.

If you want to create a new site layout from scratch, you probably want to start with something a bit more basic. You can initialize a non-themed, bare bones site by running::

 blogofile init simple_blog

The rest of this document will reference the blogofile.com source code extensively and explain it's different parts.

Directory Structure
-------------------

Inside the blogofile.com directory is the following files (abbreviated)::

 blogofile.com/
 |-- _config.cfg
 |-- _posts
 |   `-- 001. Blogofile 0.1.textile
 |-- _templates
 |   |-- atom.mako
 |   |-- base.mako
 |   |-- chronological.mako
 |   |-- footer.mako
 |   |-- head.mako
 |   |-- header.mako
 |   |-- permapage.mako
 |   |-- post.mako
 |   |-- rss.mako
 |   |-- sidebar.mako
 |   `-- site.mako
 |-- index.html.mako

Build Process
-------------

Blogofile looks for certain special files at runtime and follows a few simple rules when compiling your site:

* A _config.py file is loaded with custom settings (which can modify the following steps)

* Files are recursivley processed and copied over to the _site directory which is the compiled HTML version of the site.

* If the filename ends in ".mako", it is considered a page template, and is processed via Mako first then copied to the _site directory, stripped of the .mako extension.

* If the filename or directory starts with a "_" it is ignored and not copied to the _site directory. (other ignore patterns may be setup in _config.py)

* If the blog feature is enabled (it is by default) the _posts directory is processed and blog features are copied to the _site directory.

.. _basic-configuration:

Basic Configuration
===================

Blogofile looks for a file called _config.py in the root of your source directory before it does anything else. This is your site's main configuration file. All sites have to have a _config.py file, but for the most bare bones site, the file doesn't actually have to have anything in it.

The _config.py file is just regular `Python`_ source code, but don't let that worry you if you don't know Python, there's actually very little you need to change in this file to start out with.

At the top of the file you'll see the Basic Settings section. This section contains the settings you'll most likely want to change when creating your own site:

* **site_url** - String

  This is the root URL for your website. This is the URL that your blogofile site will be hosted at.

  example: ``http://www.xkcd.com``

* **blog_enabled** - Boolean
  
  This turns on/off the blog feature. Blogofile is obviously geared toward sites that have blogs, but you don't *need* to have one. If this is set to True, Blogofile requires several blog specific templates to exist in the **_templates** directory as described in :ref:`required-templates`

  Defaults to True

* **blog_path** - String

  This is the path of the blog off of the site_url. For example, if site_url is ``http://www.xkcd.com`` and blog_path is ``/blag`` your full URL to your blog will be ``http://www.xkcd.com/blag``

* **blog_name** - String
  
  This is the name of your blog.

  example: ``xkcd - The blag of the webcomic``

* **blog_description** - String

  This is a (short) description of your blog. Many RSS readers support/expect a description for feeds.

  example: ``A Webcomic of Romance, Sarcasm, Math, and Language``

* **blog_timezone** - String

  This is the `timezone`_ that you normally post to your blog from. 

  Defaults to ``US/Eastern``

* **blog_posts_per_page** - Integer

  This is the number of blog posts you want to display per page.

That's all you need to configure for a basic site with a blog. See :ref:`config-file` for the rest of the available settings.

.. _posts:

Posts
=====

Blog posts go inside the **_posts** directory. 

Each post is a seperate file and you can name the files whatever you want, but it's suggested to prefix your posts with a number like ``0001``, ``0002`` etc. so that when you look at the files in a directory they will be naturally ordered sequentially.

An Example Post
---------------
Here's an example post::

 ---
 categories: Category One, Category Two
 date: 2009/08/18 13:09:00
 permalink: http://www.blogofile.com/2009/08/18/first-post
 title: First Post
 ---
 This is the first post 

The post is divided into two parts, the YAML header and the post content.

.. _post-yaml:

YAML Header
-----------
The `YAML`_ portion is between the two ``---`` lines, and it describes all of the metadata for the post. The options include:

* **categories**
    A list of categories that this post should appear in, seperated by commas. You don't have to configure the categories beforehand, you are defining them right here.
* **date**
    The date of the post (year/month/day hour:minute:second)
* **permalink**
    The full permananent URL for this post. This is optional, one will be generated automatically if left blank. (see :ref:`config-blog-auto-permalink`)
* **title**
    The title for the post

.. _post-content:

Post Content
------------
The post content is written using a markup language, currently Blogofile supports several to choose from:

* `Markdown`_ (files end in .markdown)
* `Textile`_ (files end in .textile)
* `Org Mode`_ (files end in .org)
* or plain old HTML (files end in .html)

The content of the post goes directly after the YAML portion and uses whatever markup language is indicated by the file extension of the post file.

Templates
=========

Templates are at the very heart of Blogofile; they control every aspect of how the site is structured. Blogofile uses the `Mako`_ templating engine which has a very active community and `great documentation`_. Blogofile doesn't try to limit what you can do with your templates, you've got the full power of Mako so go ahead and use it.

Blogofile does makesa distinction between two basic kinds of templates, **Page** templates and **Reusable** templates.

Page templates represent a single page (or URL) on your site. These are rendered to HTML and copied to the _site directory in the same location where they reside in the source directory.

Reusable templates are contained (by convention) in the _templates directory. These are features that you want to include on many pages, eg. headers, footers, sidebars etc. They do not represent any particular page (or URL) but are rather `inherrited`_ or `included`_ inside other templates.


.. _required-templates:

Blog Required Templates
-----------------------
The most bare bones site does not require any templates. However, to use the blog feature (see :ref:`config-blog-enabled`) you need the following reusable templates:

* **site.mako**
   A base template that establishes the general look of the entire site.
* **head.mako**
   The <head> tag area of the site.
* **header.mako**
   The top portion of the site, that's on every page.
* **footer.mako**
   The bottom portion of the site, that's on every page.
* **post.mako**
   Defines what a single blog post looks like
* **permapage.mako**
   Defines the permalink page for a post, including comments section
* **chronological.mako**
   The template that renders a chronological rendering of blog entries
* **sidebar.mako**
   Defines the sidebar on the site
* **atom.mako**
   Atom feed
* **rss.mako**
   RSS feed

Even if you're not using the blog, it is reccommended that you create a similar site.mako file and include it in all your page templates so that you can create a standard look and feel for your site.

Template Environment
--------------------

When Blogofile renders a template, it has an environment created for it that contains many useful objects:

* **posts**
   A list of all the blog post objects.
* **config**
   The blogofile config file (loaded from _config.py)
* **archive_links**
   Metadata for the archive links listed by month.
* **all_categories**
    All the categories for the blog posts.
* **category_link_names**
    A mapping of Category names to their URL friendly equivalents

These can all be accessed within your templates using `Mako syntax`_.

.. only:: latex

   .. target-notes::
      :class: hidden

.. _zip file: http://github.com/EnigmaCurry/blogofile.com/zipball/master

.. _compiler: http://en.wikipedia.org/wiki/Compiler

.. _git: http://www.git-scm.org

.. _Mako: http://www.makotemplates.org

.. _Python: http://www.python.org

.. _timezone: http://en.wikipedia.org/wiki/List_of_zoneinfo_time_zones

.. _YAML: http://en.wikipedia.org/wiki/YAML

.. _Markdown: http://en.wikipedia.org/wiki/Markdown

.. _Textile: http://en.wikipedia.org/wiki/Textile_(markup_language)

.. _Org Mode: http://orgmode.org/

.. _great documentation: http://www.makotemplates.org/docs/

.. _inherrited: http://www.makotemplates.org/docs/inheritance.html

.. _included: http://www.makotemplates.org/docs/syntax.html#syntax_tags_include

.. _Mako syntax: http://www.makotemplates.org/docs/syntax.html#syntax_expression
