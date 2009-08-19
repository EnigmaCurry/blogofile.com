Blogofile Site Overview
***********************
An Example
==========
Blogofile is a website **compiler**. Just like when writing a regular computer program, you start writing a blogofile based website with source code.

The best way to understand how Blogofile works is to look at an example. You can checkout the source code for the main Blogofile.com website with git::

  git clone git://github.com/EnigmaCurry/blogofile.com.git

or alternatively, just `download the zip file <http://github.com/EnigmaCurry/blogofile.com/zipball/master>`_ which contains the same thing.

The rest of this document will reference this source code extensively and explain it's different parts.

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
* If the filename or directory starts with a "_" it is ignored and not copid to the _site directory. (other ignore patterns may be setup in _config.py)
* If the blog feature is enabled (it is by default) the _posts directory is processed and blog features are copied to the _site directory.

Configuration File
==================

Blogofile looks for a file called _config.py in the root of your source directory before it does anything else. This is your site's main configuration file.

The _config.py file is just regular Python source code, but don't let that worry you if you don't know Python, there's actually very little you need to change in this file to start out with.

At the top of the file you'll see the Basic Settings section. This section contains the settings you'll most likely want to change when creating your own site:

* **blog_enabled** 
   This setting enables the blog feature of Blogofile. You can, if you want, use Blogofile for things other than blogs. Most people will leave this setting set to **True**.
* **blog_name** 
   This setting is the name of your blog.
* **blog_url** 
   This is the full URL of your blog, starting with ``http://``
* **blog_description** 
   A longer description of your blog. Most RSS readers support a description.
* **blog_timezone** 
   This is the `timezone <http://en.wikipedia.org/wiki/List_of_zoneinfo_time_zones>`_ that you normally post to your blog from. 
* **blog_posts_per_page**
   The default number of blog posts you want per page.

That's all you need to configure for a basic site with a blog. The rest of the file changes the default behaviour of blogofile and should only be touched for intermediate or advanced use cases.

.. _posts:

Posts
=====

Blog posts go inside the **_posts** directory. Each post is a seperate file and you can name the files whatever you want, but it's suggested to prefix your posts with a number like 0001, 0002 etc so that when you look at the files in a directory they will be naturally ordered sequentially.

Posts are written using a markup language, currently Blogofile supports several to choose from:

* `Markdown <http://en.wikipedia.org/wiki/Markdown>`_ (files end in .markdown)
* `Textile <http://en.wikipedia.org/wiki/Textile_(markup_language)>`_ (files end in .textile)
* `Org Mode <http://orgmode.org/>`_ (files end in .org)
* or plain old HTML (files end in .html)

In addtion, these files support a YAML syntax at the top of the file that describes meta data for the post, for example::

 ---
 categories: Category One, Category Two
 date: 2009/08/18 13:09:00
 permalink: http://www.blogofile.com/2009/08/18/first-post
 title: First Post
 ---
 This is the first post 

The YAML portion is between the two ``---`` lines, the options include:

* **categories**
    A list of categories that this post should appear in, seperated by commas.
* **date**
    The date of the post (year/month/day hour:minute:second)
* **permalink**
    The full permananent URL for this post. This is optional, one will be generated automatically if left blank.
* **title**
    The title for the post

The content of the post goes directly after the YAML portion and uses whatever markup language is indicated by the file extension of the post file.



Templates
=========

Templates are at the very heart of Blogofile; they control every aspect of how the site is structured. Blogofile uses the `Mako <http://www.makotemplates.org>`_ templating engine which has a very active community and `great documentation <http://www.makotemplates.org/docs/>`_. Blogofile doesn't try to limit what you can do with your templates, you've got the full power of Mako so go ahead and use it.

Blogofile does makesa distinction between two basic kinds of templates, **Page** templates and **Reusable** templates.

Page templates represent a single page (or URL) on your site. These are rendered to HTML and copied to the _site directory in the same location where they reside in the source directory.

Reusable templates are contained (by convention) in the _templates directory. These are features that you want to include on many pages, eg. headers, footers, sidebars etc. They do not represent any particular page (or URL) but are rather `inherrited <http://www.makotemplates.org/docs/inheritance.html>`_ or `included <http://www.makotemplates.org/docs/syntax.html#syntax_tags_include>`_ inside other templates.


Required Templates
------------------
The most bare bones site does not require any templates. However, to use the blog feature (blog_enabled in _config.py) you need the following reusable templates:

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

These can all be accessed within your templates using `Mako syntax <http://www.makotemplates.org/docs/syntax.html#syntax_expression>`_.

