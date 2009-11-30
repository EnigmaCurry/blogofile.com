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

Inside the source directory is the following files (abbreviated)::

 |-- _config.py
 |-- _filters
 |   `-- playnice.py
 |-- _posts
 |   |-- 001. Blogofile 0.1.textile
 |   |-- 002. The History of Blogofile.textile
 |   `-- 003. Blogofile 0.3.textile
 |-- _templates
 |   |-- 0.initial.py
 |   |-- archives.py
 |   |-- atom.mako
 |   |-- base.mako
 |   |-- categories.py
 |   |-- chronological.mako
 |   |-- chronological.py
 |   |-- feed.py
 |   |-- footer.mako
 |   |-- head.mako
 |   |-- header.mako
 |   |-- permapage.mako
 |   |-- permapage.py
 |   |-- post.mako
 |   |-- post_excerpt.mako
 |   |-- rss.mako
 |   |-- sidebar.mako
 |   `-- site.mako
 |-- css
 |   `-- site.css
 |-- index.html.mako
 `-- js
     `-- site.js
 
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

Blogofile looks for a file called ``_config.py`` in the root of your source directory before it does anything else. This is your site's main configuration file. All sites have to have a _config.py file, but Blogofile has sensible default values and so for a bare bones site, the file can start out completely blank.

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
The `YAML`_ portion is between the two ``---`` lines, and it describes all of the metadata for the post. You can define as many fields as you like, but there are some names that are reserved for general purpose use:

* **title**
    A one-line free-form title for the post.
* **date**
    The date that the post was originally created. (year/month/day hour:minute:second).
* **updated**
    The date that the post was last updated. (year/month/day hour:minute:second).
* **categories**
    A list of categories that the post pertains to, each seperated by commas. You don't have to configure the categories beforehand, you are defining them right here.
* **tags**
    A list of tags that the post pertains to, each seperated by commas.
* **permalink**
    The full permanent URL for this post. This is optional, one will be generated automatically if left blank. (see :ref:`config-blog-auto-permalink`)
* **format**
    The format of the post (eg: html, textile, markdown, org).
* **guid**
    A unique hash for the post, if not provided it is assumed that the permalink is the guid.
* **author**
    The name of the author of the post.
* **draft**
    If 'true' or 'True', the post is considered to be only a draft and not to be published.
* **source**
    Reserved internally.
* **yaml**
    Reserved internally.
* **content**
    Reserved internally.
* **filename**
    Reserved internally.

This list is also defined in the blogofile source code under ``blogofile.post.reserved_field_names`` and can be accessed as a dictionary at runtime.

.. _post-content:

Post Content
------------
The post content is written using a markup language, currently Blogofile supports several to choose from:

* `Markdown`_ (files end in .markdown)
* `Textile`_ (files end in .textile)
* `Org Mode`_ (files end in .org)
* or plain old HTML (files end in .html by convention, but if it's not one of the above, posts default to HTML anyway)

The content of the post goes directly after the YAML portion and uses whatever markup language is indicated by the file extension of the post file.

Templates
=========

Templates are at the very heart of Blogofile; they control every aspect of how the site is structured. Blogofile uses the `Mako`_ templating engine which has a very active community and `great documentation`_. Blogofile doesn't try to limit what you can do with your templates, you've got the full power of Mako so go ahead and use it.

Blogofile makes a distinction between three basic kinds of templates:

* **Page** templates
* **Reusable** templates
* **Python** "templates"

Page templates represent a single page (or URL) on your site. These are rendered to HTML and copied to the _site directory in the same location where they reside in the source directory.

Reusable templates are contained in the _templates directory. These are features that you want to include on many pages, eg. headers, footers, sidebars etc. They do not represent any particular page (or URL) but are rather `inherrited`_ or `included`_ inside other templates.

The third variety, Python "templates", aren't really templates at all, but are Python source files in the _templates directory that are used when you're doing something rather advanced and templates aren't sufficient, like when you want to create several sequential or dynamically-linked pages. This type of template can still (and probably should) reference other Mako based templates.


.. _required-templates:

Blog Templates
-----------------------
The most bare bones site does not require any templates. However, if you're using the blog feature (see :ref:`config-blog-enabled`) you will want some templates to generate the basic blog features such as creating the permalinked pages, generating chronological listings, archives, category listings etc.

As an example, the blogofile.com sources include the following reusable templates in the _templates directory, which you're free to adapt for use in your own sites:

* **0.initial.py** - Python templates are run in lexicographical order, so this file is always run first. It just sets up some things before other templates are run.
* **site.mako** - Establishes the general look of every page, organizing the header, content pane, sidebar and footer.
* **base.mako** - The template from which all other templates ultimately inherit. Although most things are inherited in a child of this template: site.mako
* **archives.py** - Builds the blog archives on a year/month basis under the URL structure /archive/year/month/
* **chronological.py** - Used for creating a chronological list of posts (reused numerous times eg. in archives and categories templates)
* **chronological.mako** - Helper template used in chronological.py
* **categories.py** - Builds the chronological listing of posts per category in the URL structure /category/
* **permapage.py** - Used for creating a permalinked page for a post.
* **permapage.mako** - Helper template used in permapage.py
* **feed.py** - Generic feed writing methods used to write both the global RSS/Atom feeds as well as the per-category RSS/Atom feeds.
* **atom.mako** - Used for creating Atom feeds of posts.
* **rss.mako** - Used for creating RSS feeds of posts 
* **post.mako** - Used for generating a single post
* **post_excerpt.mako** - An alternative to post.mako that just shows an excerpt of the post.
* **footer.mako** - A footer used on every page.
* **header.mako** - A header used on every page.
* **head.mako** - The <head> tag of every page
* **sidebar.mako** - A sidebar used on every page.

Even if you're creating your site from scratch, it is recommended that you create a similar site.mako file and include it in all your page templates so that you can create a standard look and feel for your site.

Template Environment
--------------------

TODO: Document blogofile.cache and general usage inside of a template.


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
