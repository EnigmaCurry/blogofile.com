.. _what-you-get-for-free:

What you get for free
=====================

Blogofile doesn't really do a whole lot until you tell it what to
do. The way you to tell it to do things is by creating
:ref:`Templates`, :ref:`Controllers`, :ref:`Filters`, or
:ref:`Plugins`. This guide will show you all about those things. But
let's not get ahead of ourselves, there are a few things that
Blogofile does out-of-the-box with zero configuration.

By creating a directory, and a blank file inside it called
``_config.py`` you've created the most basic Blogofile site -- one
that does nothing. Without further configuration of ``_config.py``,
you'll only get the default build behavior. However, it's probably a
good idea to understand what that behavior is before you get carried
away with customizations. This chapter focuses on what you get for
free without doing much at all. Subsequent chapters will show you
everything else you can do through customization.

The default build behavior
--------------------------

What does Blogofile do when you don't configure anything? Let's find
out.

Create a blank site::

    mkdir mysite
    touch mysite/_config.py

That's all there is to a create blank Blogofile site -- A directory
with a blank ``_config.py`` file in it. You can actually build this
site::

    cd mysite
    blogofile build

The only thing the build did at this point was create a ``_site``
directory, but there's nothing in it yet. The ``_site`` directory will
eventually become the website you upload to your webserver once we
have some actual content in it.

If you create a file called ``test.txt`` in the ``mysite`` directory
and rebuild (run ``blogofile build`` again) you'll see that it gets
copied to the ``_site`` directory.

Create another directory to store some CSS files::

    mkdir css
    touch css/site.css
    touch css/blog.css

And rebuild once more::

    blogofile build

At this point you've got a directory structure that looks like this::

    mysite
    |-- _config.py
    |-- css
    |   |-- blog.css
    |   `-- site.css
    |-- test.txt
    |-- _site
    |   |-- css
    |   |   |-- blog.css
    |   |   `-- site.css
    `   `-- test.txt

Notice that every file except for ``_config.py`` got copied to the
``_site`` directory. Blogofile, by default, recursively copies all
files and directories from the ``mysite`` directory into the ``_site``
directory. It skips anything that starts with an underscore (like
``_config.py`` or ``_site``.)

You probably don't want to rely on this copying feature too
heavily. It's convenient for small numbers of files like CSS files or
anything else directly related to the site itself. But if you have a
lot of static files to serve on your site, it will get expensive (in
terms of hard drive IO) to copy all of them each time you build your
site. You may want to consider having some of those files outside of
Blogofile's control.

:ref:`Templates` are also supported without any configuration, but
we'll get to that later on in subsequent chapters. For now, just
realize that files ending in ``.mako``, ``.jinja2``, ``.markdown``,
``.rst``, and ``.textile`` are handled a bit differently than other
files, but they still end up in the ``_site`` directory after some
processing is done to them.

