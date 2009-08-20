Introduction
************

* Definition: Blogophile --
   A person who is fond of or obsessed with blogs or blogging.

* Definition: Blogofile --
   A static file blog engine/compiler, inspired by `Jekyll <http://jekyllrb.com/>`_.


Welcome to Blogofile
====================

Blogofile is a simple blog engine that requires no database and no special hosting environment. You customize a set of templates with `Mako <http://www.maktotemplates.org>`_, create posts in a markup language of your choice (see :ref:`post-content`) and Blogofile renders your entire blog as static HTML and Atom/RSS feeds which you can then upload to any old web server you like. 

**No CGI or scripting environment is needed on the server.**

Why you should be using Blogofile
=================================
* Blogofile is **free software**, released under a non-enforced `MIT license <http://www.blogofile.com/LICENSE.html>`_.
* Blogofile is **fast**, the server doesn't need to do any database lookups or any template rendering.
* Blogofile is **inexpensive** to host. Any HTTP web server can host a blogofile blog.
* Blogofile is **modern**, supporting all the common blogging features:

 * Categories.
 * Tags.
 * Comments and Trackbacks with effective spam filtering using Disqus. (Sorry no pingback support.. yet.)
 * RSS and Atom feeds, one for all your posts, as well as one per category.
 * Syntax highlighting for source code listings.

* Blogofile is **secure**, there's nothing executable on the server.
* Blogofile works **offline**, especially when managed with git, your entire blog can go with you anywhere. This also makes backups dirt simple.
* Blogofile is **file based**, so you can edit it with your favorite text editor, not some crappy web interface.
* Automatic deployment with git. Publish to your blog with a simple "git push".

.. _install-blogofile:

Installing Blogofile
====================
Blogofile is still under development, and should be considered beta software at the moment, but should be usable even before the 1.0 release.

Prerequisites
-------------

Make sure you have Python and Setuptools installed. 

On Ubuntu you just need to run::

 sudo apt-get install python-setuptools

Install
-------
Download and install Blogofile with::

 easy_install Blogofile

You can also get the latest development source code from github::

 git clone git://github.com/EnigmaCurry/blogofile.git

