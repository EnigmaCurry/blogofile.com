---
title: Preview of Blogofile 0.8
permalink: http://www.blogofile.com/blog/2011/04/30/preview-of-blogofile-0.8
date: 2011/04/30 13:42:04
author: Ryan McGuire
categories: development
guid: b'1prqgKJ6YXwljJSKr9r5kpE49F4='
---

I'm hard at work on Blogofile 0.8 which is going to be a **huge** upgrade
from 0.7.1. I want to start writing down some of the new features and
things that have changed, so as not to overwhelm you all at once on the
day of release.

Here's a brief changelog from 0.7.1 to 0.8:

 * Python 3 support! Blogofile now runs on Python 2.6, 2.7, 3.1 or 3.2.
 * Plugins.
 * New template engines.
 * ``blogofile build`` now works from any subdirectory in your source tree.
 * Cross-python-version unit tests with [Tox](http://codespeak.net/tox/).
 * Full stack testing with in-browser [Selenium](http://seleniumhq.org/) tests.
 * HTML 5 Boilerplate enabled site templates.
 * Command line completion and plugin commands.
 * Blogger import script (contributed by Seth de l'Isle)
 * Markdown [extensions](http://www.freewisdom.org/projects/python-markdown/Extensions)
   are enabled by user configuration.
 * Static files can be configured to hard link rather than copy into
   the _site directory (Contributed by Nick Craig-Wood)

These are all planned features for 0.8, and they are all at least
partially implemented, but I'm still working on polishing them up, so
they may or may not be fully working at the moment. This is just a
preview.
   
Python 3
--------

With the release of Python 3.2, py3k has finally matured into a stable
and well built product. All of the dependencies of Blogofile are working
well on Python 3, and therefore it's the right time to move forward and
have Blogofile embrace Python 3 as well.

Going forward, all new development on Blogofile is being done in
Python 3.2. This does not mean however, that I'm abandoning Python
2 -- that would be catastrophic. There are a lot of reasons you may want
to stay with Python 2: it's what you know and are comfortable with, a
library you depend on only works in older versions, you feel Python 3
isn't mature yet (but it is!) For many reasons, it's important that
Blogofile remains working in Python 2 just as well it does in Python
3. Even this site, blogofile.com, is still running on Python 2 because
Sphinx (stable) doesn't yet support Python 3.

Blogofile 0.8 introduces what I hope to be a smooth migration for
people who want to use Python 3, but also to maintain full feature
compatibility for users still using Python 2.

The [source code at github](http://github.com/EnigmaCurry/blogofile)
is all Python 3 code. If you're checking out from git, you will need
Python 3. Python 2 versions are built by converting this code with the
[3to2](http://pypi.python.org/pypi/3to2_py3k/1.0) tool. This is
automated through the standard sdist facility:

    python setup.py sdist

This packages a tarball in the ``dist/`` directory that contains both
the regular python3 source code as well as the python2 source
code. Depending on the python version used to install it, the correct
source code gets installed. This is the same type of tarball that will
be uploaded to [PyPI](http://pypi.python.org/pypi) once Blogofile is
stable and is released. Users will be able to run ``pip install
blogofile`` on any version of Python (2.6+, 3.1+) and run blogofile
without any hassle, and no need for the end user to install 3to2
because the conversion has already been applied.

[Tox](http://codespeak.net/tox/) is a testing tool that leverages
[virtualenv](http://pypi.python.org/pypi/virtualenv) to run unit tests
within multiple Python environments. Blogofile is currently using Tox
to verify that sites built with Blogofile work well in multiple Python
versions.

Plugins
-------

Blogofile 0.8 includes new plugin support. Plugins are just packages
of controllers, filters, templates, and other files. These are
distributed and installed as regular python packages (eg. ``easy_install
blogofile_blog``). Since plugins are installed separately from
Blogofile, you can upgrade them independently. Installed plugins are
detected by Blogofile at runtime and if the user configures the plugin
in their ``_config.py``, the plugin can add functionality to a Blogofile
site.

The blog controller from 0.7.1 has been completely removed from
Blogofile and has been [repackaged as a
plugin](https://github.com/EnigmaCurry/blogofile_blog). This has many
advantages:

 * New stable releases of Blogofile and the blog controller are now
   independent of each other.
 * The blog controller is no longer placed into the user's site source
   code. Instead, the controller remains in the Python library
   directory and is only referenced and configured in the user's
   ``_config.py``. This let's you upgrade your site to new versions
   without having you to delete or otherwise modify your ``_controllers/``
   directory as you do now in Blogofile 0.7.1 or older. The blog
   templates (post.mako, chronological.mako etc.) can be copied into
   userspace and customized if desired.

Also note, that you don't have to use the blog plugin if you don't
want to, you can just as easily keep using the old blog controller
from 0.7.1 if you have a legacy site.
   
Command Completion and Plugin Commands
--------------------------------------

0.8 introduces bash command line completion. Partially typing a
blogofile command and then pressing the TAB key will complete the
command you're typing or will provide you with a list of possible
completions.

This can be turned on by placing the following into your ``~/.bashrc``
file:

    command -v blogofile &>/dev/null && source <(BLOGOFILE_BASH_BOOTSTRAP=true blogofile)

Plugins can now extend the blogofile command line executable with
their own commands, which makes command line completion all the more
convenient. For instance, these are the commands implemented in the
blog plugin:

    usage: blogofile blog [-h] {templates,post} ...

    positional arguments:
      {templates,post}
        templates       Blog template helpers
        post            Blog post helpers

Typing ``blogofile blog post create <title>`` will create a new blog
post inside your ``_posts/`` directory pre-populated with today's date and the
title you gave it. This allows you to get started writing your blog
posts more easily without having to write all the post YAML
yourself. This feature was created in collaboration with [Ant Zucaro](http://www.antzucaro.com/).

Running ``blogofile blog templates copy _templates/blog`` will copy all
of the blog templates into your site's source directory. This let's
you customize them to your own liking. If you do this, you need to
write the following in your ``_config.py`` to tell the blog controller
where to refer to these templates:

    plugins.blog.template_path = "_templates/blog"

Template Engines
----------------

Blogofile has supported [Mako](http://www.makotemplates.org/) as it's
templating engine ever since its first release. I personally feel that
Mako is the very best templating engine available for Python, but
you're free to have a different opinion. I think choice is also a
great thing, so Blogofile template support has been abstracted to
support other engines. Included in 0.8 is a
[Jinja2](http://jinja.pocoo.org/) implementation (which is very
similar to Django templates) and a new blogofile specific template
called ``FilterTemplate``.

The user's ``_config.py`` now configures a mapping of file extension
to template type. Here's what you get by default:

    templates.engines = HC(
      mako = MakoTemplate,
      jinja = JinjaTemplate,
      jinja2 = JinjaTemplate,
      markdown = MarkdownTemplate,
      rst = RestructuredTextTemplate,
      textile = TextileTemplate
      )

If you've been using Blogofile long, you already know about the
first one: Mako. However, instead of being hard-coded inside the
blogofile [writer
class](https://github.com/EnigmaCurry/blogofile/blob/plugins/blogofile/writer.py)
to render files ending in ``.mako`` with Mako, Blogofile 0.8 uses the
above configuration to know what template type to associate it
with. So, ``.mako`` gets rendered with the MakoTemplate class,
``.jinja`` and ``.jinja2`` get's rendered with JinjaTemplate etc. Feel
free to redefine this yourself in your own ``_config.py`` if you feel
the need.

An important configuration item sets the site base template:

    site.base_template = "site.mako"

By default it's called ``site.mako`` which is consistent with how
``simple_blog`` has always called it. It's more important now to realize
what this file is however, because all templates, __even templates of
different engines__ can inherit from this file. For instance, if your
site uses ``site.mako`` as it's base template but you have a jinja2
template somewhere in your source directory (or a plugin you installed
uses one), you don't have to recreate your entire site structure in jinja
-- instead, you can have jinja2 inherit from your mako templates
directly:

    {% extends "bf_base_template" %}

When you render a template, Blogofile detects if
``site.base_template`` is of a different template type than the
currently rendering template. If it is, it renders the base template
first, installs the base template as an alias called
``bf_base_template``, then renders the first template inside of the
base template at the right place. The "right place" is also
configurable via ``templates.content_blocks``, but you shouldn't need
to change that unless you're introducing your own template engine.

``FilterTemplates`` are a new template type altogether that lets you use
any Blogofile
[filter](http://blogofile.com/documentation/filters.html) as it's own
template engine. This let's you use, for instance, Markdown and
reStructuredText files as standalone template types. In Blogofile
0.7.1 you could only use markdown or reStrucutredText inside blog
posts, but now you can use it anywhere you want in your site source by
placing a file ending in ``.markdown`` or ``.rst``. These files will
also inherit your site base template, so all you need inside the file
is the content that you want on the page and it will look like all the
other pages on your site once rendered. Please be aware that markdown
and reStruturedText are not really full template engines, so if you're
doing anything complex with controllers, you probably should stick
with Mako or Jinja2. Really, it's just a convenient way to create a
static page quickly without needing to code HTML.


HTML 5 Boilerplate and other example sites
------------------------------------------

[HTML5Boilerplate](http://html5boilerplate.com/) is the new hotness in
web-design -- it provides a great base to start from for creating new
sites with all the new features that HTML 5 brings.

Blogofile is going to have a ``simple_blog`` variant that includes these
features:

    blogofile init simple_blog_html5

That will get you started. It's still unthemed just like
``simple_blog`` is today. I'm working on even more variants that
include some themes to get you a decent looking site out of the box.


Checking out the code and getting started
-----------------------------------------

If you want to start playing around with Blogofile 0.8 right now, even
before it's stable, go right ahead. I'd appreciate feedback to know
what is and isn't working for you, or any confusion you have.

Please note, that these instructions are only valid for people wishing
to get a preview of Blogofile and don't mind checking out the source code
from git and running code that might not be fully working yet. Also,
these instructions are about ten times longer than what will be
necessary once Blogofile is released as a stable build. Once that
happens, you won't need any virtual environments or 3to2 conversions
etc. Essentially, these instructions help to create a **development**
environment.

### Prerequisites

 * Python 3.1+ (even if you plan on using Python 2 to build your site)
 * [Distribute](http://pypi.python.org/pypi/distribute)
 * [3to2](http://pypi.python.org/pypi/3to2_py3k) (make sure it's the Python 3 version as linked here)
 * [virtualenv](http://pypi.python.org/pypi/virtualenv) - not required, but recommended, especially if you're
   already running a stable version of Blogofile.
   
If you want to run the unit tests, you'll also need:

 * [Tox](http://codespeak.net/tox/)
 * Python 2.7 - This runs the selenium tests which don't support
   python 3 yet.

### Install Blogofile

I'll assume you're using Ubuntu Linux. If not, you'll need to translate
these instructions yourself. Developer docs that I'm currently writing
will be friendlier for non Ubuntu folks.

Install Python 3.2. If you're not running Ubuntu 11.04 yet, you'll need to
install the PPA for Python 3.2 and install from there:

    sudo apt-get install python-software-properties
    sudo add-apt-repository ppa:irie/python3.2
    sudo apt-get update
    sudo apt-get install python3 python3-dev

Install distribute:

    sudo su -c "wget http://python-distribute.org/distribute_setup.py -O - | python3"

Install virtualenv:

    sudo easy_install-3.2 virtualenv
    
Make sure you have git:

    sudo apt-get install git-core

Checkout the Blogofile sources to a directory of your choosing which
we'll call ``$BFSRC``:

    cd $BFSRC
    git clone https://github.com/EnigmaCurry/blogofile.git .

Create a virtual environment to separate the development Blogofile
from any production version you already have installed:

    mkdir $BFSRC/venv
    virtualenv -p python3.2 --no-site-packages --prompt="(blogofile-0.8)" venv

To enter the virtual environment run:

    source $BFSRC/venv/bin/activate

You'll see your prompt now has ``(blogofile-0.8)`` prepended to it,
indicating that you're currently in the virtual environment. You'll
need to run the source command above each time you start a new
terminal window to re-enter the virtual environment.
    
If you decided to run Blogofile with python3, you're ready to install
Blogofile as a development library:

    python setup.py develop

This pulls down all the dependencies of Blogofile from the internet
and installs Blogofile as a system library in place (inside the
virtualenv of course), so any changes you make to the source
or pull from git will automatically be applied.

If you wanted to run Blogofile in python2, there's an extra step you
must take to convert the sources:

    easy_install 3to2_py3k
    python setup.py sdist

This converts all the python source to be compatible with python2 via
3to2. It creates a tarball in the ``dist/`` directory which you can
then install with python2 (outside this python3 virtualenv):

    easy_install dist/Blogofile-0.8-DEV.tar.gz

You should now have Blogofile 0.8 installed in a virtual environment
which you can verify by running:

    blogofile info

You'll see which blogofile you're running and information about where
it's pulling data from:

    This is Blogofile (version 0.8-DEV) -- http://www.blogofile.com
    You are using CPython 3.2.0 from /home/ryan/src/blogofile/venv/bin/python
    Blogofile is installed at: /home/ryan/src/blogofile/blogofile
    Default config file: /home/ryan/src/blogofile/blogofile/site_init/_config.py
    The specified directory has no _config.py, and cannot be built.
    
You can see the following from my configuration above:

  * I'm using Blogofile version ``0.8-DEV``
  * I'm using CPython 3.2.0
  * Blogofile is installed inside my virtual environment at ``/home/ryan/src/blogofile``

If ``blogofile info`` shows you a similar configuration, you've
installed it correctly.

### Install Blog Plugin

As mentioned earlier, the blog plugin is a separate install from
Blogofile itself. You can install it in the same virtual environment
created in the last step. Create a new directory parallel to
``$BFSRC``, I'll call it ``$BF_BLOG_SRC``:

    mkdir $BF_BLOG_SRC
    cd $BF_BLOG_SRC
    git clone https://github.com/EnigmaCurry/blogofile_blog.git .
    python setup.py develop

Just like Blogofile, if you're wanting to run the blog plugin in
Python 2.6+, you'll need to convert the source into a 2.x compatible
tarball and install that:

    python setup.py sdist
    easy_install dist/blogofile_blog-0.8.tar.gz

### Testing

You can now create a ``simple_blog`` for testing:

    mkdir $BFSRC/test_site
    cd $BFSRC/test_site
    blogofile init simple_blog
    blogofile build
    blogofile serve 8080

The site should build and serve locally at [http://localhost:8080](http://localhost:8080)
