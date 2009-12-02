The Makeup of a Blogofile Site
******************************
Blogofile is a website `compiler`_, but instead of translating something like C++ source code into an executable program, Blogofile takes `Mako`_ templates and other Blogofile features and compiles HTML for viewing in a web browser. This chapter introduces the basic building blocks of a Blogofile directory containing such source code.

An Example
==========
The best way to understand how Blogofile works is to look at an example. You can checkout the source code for the main Blogofile.com website::

  blogofile init blogofile.com

The above command downloads the very latest blogofile.com website source code, which requires that you have `git`_ installed on your system. If you don't have it, you can just download the `zip file`_ instead.

If you want to create a new site layout from scratch, you probably want to start with something a bit more basic. You can initialize a non-themed, bare bones site by running::

 blogofile init simple_blog

The rest of this document will reference the blogofile.com source code extensively and explain it's different parts.

Directory Structure
===================

Inside the source directory are the following files (abbreviated)::

 |-- _config.py
 |-- _templates
 |   |-- atom.mako
 |   |-- base.mako
 |   |-- chronological.mako
 |   |-- feed.py
 |   |-- footer.mako
 |   |-- head.mako
 |   |-- header.mako
 |   |-- permapage.mako
 |   |-- post.mako
 |   |-- post_excerpt.mako
 |   |-- rss.mako
 |   |-- sidebar.mako
 |   `-- site.mako
 |-- _controllers
 |   |-- 0.initial.py
 |   |-- archives.py
 |   |-- categories.py
 |   |-- chronological.py
 |   |-- feed.py
 |   |-- permapage.py
 |   `-- photo_gallery.py
 |-- _posts
 |   |-- 001. Blogofile 0.1.textile
 |   |-- 002. The History of Blogofile.textile
 |   `-- 003. Blogofile 0.3.textile
 |-- _filters
 |   `-- playnice.py
 |-- css
 |   `-- site.css
 |-- index.html.mako
 `-- js
     `-- site.js

The basic building blocks of a Blogofile site are:

 * **_config.py** - Your main Blogofile configuration file. See :ref:`config-file`
 * **Templates** - Templates dynamically create pages on your site. ``index.html.mako`` along with the entire ``_templates`` directory are examples. See :ref:`templates`
 * **Posts** - Your blog posts, contained in the ``_posts`` directory. See :ref:`posts`
 * **Filters** - contained in the ``_filters`` directory, filters can process textual data like syntax highlighters, translators, swear word censors etc. See :ref:`filters`
 * **Controllers** - contained in the ``_controllers`` directory, controllers create dynamic sections of your site, like blogs. See :ref:`controllers`

Any file not starting with an underscore (or contained in a directory starting with one) and not ending in ".mako" are considered regular files are are copied directly to your compiled site directly (eg. css/site.css js/site.js)

Building the Site
=================

Now that you have an example site initialized, we can compile the source to create a functioning website. 

Run the following to compile the source in the current directory:

    blogofile build

Blogofile should run without printing anything to the screen. If this is the case, you know that it ran successfully. Inside the _site directory you have now built a complete website based on the source code in the current directory. You can now upload the contents of the _site directory to your webserver or you can test it out in the embedded webserver included with Blogofile:

    blogofile serve 8080

Go to `http://localhost:8080 <http://localhost:8080>`_ to see the site served from the embedded webserver.

Understanding the Build Process
===============================

When the Blogofile build process is invoked, it follows this conceptual order of events:

* A ``_config.py`` file is loaded with your custom settings. See :ref:`config-file`.

* If the blog feature is enabled (:ref:`config-blog-enabled`), the blog posts in the ``_posts`` directory are processed and made available to templates. See :ref:`Posts`.

* Filters in the ``_filters`` directory are made available to templates. See :ref:`filters`.

* Files and sub-directories are recursively processed and copied over to the ``_site`` directory which becomes the compiled HTML version of the site:

  * If the filename ends in ``.mako``, it is considered a page template. It is rendered via Mako, then copied to the ``_site`` directory stripped of the ``.mako`` extension. See :ref:`templates`.

  * If the filename or directory starts with an underscore ``_`` it is ignored and not copied to the ``_site`` directory (other ignore patterns may be setup using :ref:`config-file-ignore-patterns` in ``_config.py``.)

* Controllers from the ``_controllers`` directory are run to build dynamic sections of your site, eg. the blog chronological listing, blog archives, blog categories etc. See :ref:`controllers`.

.. only:: latex

   .. target-notes::
      :class: hidden

.. _Mako: http://www.makotemplates.org

.. _zip file: http://github.com/EnigmaCurry/blogofile.com/zipball/master

.. _compiler: http://en.wikipedia.org/wiki/Compiler

.. _git: http://www.git-scm.org

.. _Python: http://www.python.org

.. _timezone: http://en.wikipedia.org/wiki/List_of_zoneinfo_time_zones

