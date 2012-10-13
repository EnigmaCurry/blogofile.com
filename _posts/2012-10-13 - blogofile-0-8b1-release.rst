---
title: Blogofile 0.8b1 Released
permalink: http://www.blogofile.com/blog/2012/10/13/blogofile-0-8b1-release
date: 2012/10/13 11:23:31
author: Doug Latornell
categories: releases
guid: b'88iJejYSkqTizdrUyNcyInsbf-4='
---

I'm happy to announce the release of Blogofile 0.8b1 and blogofile_blog 0.8b1.


Why a beta release?
-------------------

It's been a long time since the last ``Blogofile`` release.
I've moved the work that Ryan started forward to make the core static site
builder "pluggable",
and move an example blog engine into a plugin.
There is certainly more work to do, but the codebase is stable,
and in pretty good shape now.
It builds the this site,
my personal site (`douglatornell.ca`_),
and several other people's sites and blogs.
So, a release is in order.
Doing a beta release is an opportunity to make sure that the packaging
is correct.
There are still some minor issues to clean up (see the 0.8 milestone
in the GitHub issue trackers).
There is also lots of updating to do in the docs.

.. _blogofile.com: http://blogofile.com/
.. _douglatornell.ca: http://douglatornell.ca/

And, finally, there is the issue of migrating sites from 0.7.x to 0.8.
Several people have offered to help figure out and document that process
and I'm calling for that help now.
At this point I honestly don't know what the best strategy for that
migration is - a recipe in the docs, a helper script, ...
If you are using ``Blogofile`` 0.7 or 0.7.1 please try out 0.8b1 and
tell the community how you migrated your site.
You can leave a comment_ on this post,
the `mailing list`_,
or you can clone the `GitHub repo`_,
add to the Migrating Sites from 0.7.x to 0.8 section of the docs,
or add a migration helper script to the ``converters/`` directory,
and send a pull request.

.. _comment: http://www.blogofile.com/blog/2012/09/05/blogofile-0-8b1-release#disqus_thread
.. _mailing list: http://groups.google.com/group/blogofile-discuss
.. _GitHub repo: https://github.com/EnigmaCurry/blogofile/


What's New
----------

* ``Blogofile`` is now the static site builder that has always been at
  the core of the Blogofile project.
  ``blogofile_blog`` is a Blogofile plugin that provides templates,
  controllers,
  and filters
  (and even some sample posts)
  to use ``Blogofile`` to create a simple HTML5Boilerplate_ based blog.

  .. _HTML5Boilerplate: http://html5boilerplate.com/

  I realized in the run-up to this release that import dependencies
  between ``Blogofile`` and ``blogofile_blog`` make the installation
  steps less straight forward than I had hoped.
  For now::

    pip install Blogofile
    pip install blogofile_blog

  in that order (or your favourite ``easy_install`` or ``python
  setup.py`` incantations) are what's needed.
  I'm hoping that the installation story can be improved,
  perhaps with the help of the stevedore_ library,
  but I didn't want to delay this release any longer to explore that.

  .. _stevedore: http://stevedore.readthedocs.org/en/latest/index.html

* The documentation source files have been moved into the project
  repository.
  They are built and rendered at http://docs.blogofile.com/ thanks to
  the readthedocs.org service.

* The ``init`` sub-command syntax and functionality have changed; see
  ``blogofile help init``.

* The configuration system has been refactored.
  The default configuration settings are now in the ``default_config.py``
  module.

* As a result of the refactoring of the initialization function,
  and the configuration system,
  the ``site_init`` directory has been eliminated.

* There is improved Unicode handling in slugs, thanks to Wasil Sergejczyk.
  See https://github.com/EnigmaCurry/blogofile/issues/124

* The codebase has been unified for Python 2.6, 2.7 and 3.2
  (no 2to3 or 3to2 conversion required).

* The command line completion feature has been removed so as to avoid
  maintaining a bundled version of the ``argparse`` library
  (included in the standard library for Python 2.7 and
  3.2+).
  It will be installed by ``setup.py`` from PyPI for Python 2.6.

See ``CHANGES.txt`` in the repos for more details on bug fixes, etc.


Breaking Changes
----------------

If you've been using the ``Blogofile`` plugins branch and the
``blogofile_blog`` repo from GitHub but haven't updated in a while you
should take note of the following:

* In the past the functions in ``blogofile.util`` were available
  in templates in both the ``bf.util`` and the ``bf.config.util`` namespaces.
  The latter no longer works.
  If you want to use a ``blogofile.util`` function in a template,
  use ``bf.util``;
  e.g. ``bf.util.site_path_helper``.

* The constructor argument for ``blogofile.plugin.PluginTools`` is now the
  plugin module,
  rather than its name.
  This change only affects people who have developed their own plugins.
  See ``blogofile_blog.__init__.py`` for an example of how
  ``blogofile.plugin.PluginTools`` is now instantiated.


Into the Future
---------------

I had a `long list of hopes and goals`_ when I became the maintainer of
``Blogofile`` a few months ago.
I've accomplished some of them in this release,
but there is more work I want to do,
and more ideas I want to explore.

.. _long list of hopes and goals: https://groups.google.com/d/topic/blogofile-discuss/jwMsJHzAmgw/discussion

Part of that is the idea that there can be an ecosystem of plugins around
the ``Blogofile`` core that allow users to add features, themes, etc. to their
blogs,
and allow ``Blogofile`` to be used to build other kinds of sites.
In that context,
``blogofile_blog`` is the reference plugin implementation for developers.
But for that to really work the plugin API needs to be well defined,
and well documented.
That's not the case now.
The API is still definitely subject to change,
and documentation of it has barely begun.
Getting that all whipped into shape is one of the goals for the next release.

There are also feature suggestions, requests, and even some fully
developed patches in the issue trackers on GitHub.
For example:

* When using ``blogofile serve``, add automatic site re-compilation
  when a source file changes instead of having to stop the server,
  build, and restart the server.

* Develop a better syntax highlighter for posts that use reStructuredText markup.

* Add more conversion scripts from other blog platforms.

I had to set those aside in order to get 0.8 to a release.
I hope that some of those enhancements will mature and be released in
the coming months.

I'd like to thank Ryan for creating ``blogofile``,
and for his support of my efforts to move ``blogofile`` forward.
Thanks also to the many members of the community who have contributed
bug reports, pull requests, and discussion and answers on the mailing list.
