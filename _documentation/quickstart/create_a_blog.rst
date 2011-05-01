Creating a blog
***************

Once Blogofile is installed, you're ready to create your first
Blogofile site. Here's a quick tutorial for how to create a simple blog.

Site Initialization
===================

To create a new site, you start by creating a new directory::

  mkdir mysite

Blogofile is run from the command line inside this new directory, so
let's go into the new directory where you'll start doing your work::

  cd mysite

You can now initialize an example website from one distributed with
Blogofile::

  blogofile init simple_blog

If you're not in an empty directory, Blogofile will complain::

  This directory is not empty, will not attempt to initialize here.

So make sure you're inside the the new directory you created and try
again if needed.


Building your site
==================

The simple_blog template you just initialized is a fully working
example that we can build straightaway::

  blogofile build

This command interprets all the source files in this directory and
builds a website from it. Blogofile will place the generated website
in a sub-directory called ``_site.``

To view the website properly, the website needs to be served by a
webserver. Blogofile comes with it's own embedded webserver that you
can use for testing purposes::

  blogofile serve 8080

This will start up a test server to view the site you just built. Load
`http://localhost:8080 <http://localhost:8080>`_ in your web-browser
to see the website.

The website you see is very basic, with a white background and text
only. It's designed this way to show the basics of a blogofile site
without distractions. You'll see more visually exciting examples of
Blogofile sites a bit later on.

Creating some blog posts
========================

The simple_blog template comes with 10 or so example blog posts that
demonstrate various features of Blogofile. These posts are in a
sub-directory called `_posts`.

You may want to keep these example posts for reference until you get
the hang of it, but you can safely delete everything in the `_posts`
directory to create an empty blog.

To create a new blog post you run::

  blogofile blog post create "Hello, World!"

"Hello, World!" is where you type the title for the blog post. This
creates a new file inside the `_posts` directory that has the minimum
fields pre-filled in. You can also bypass this entire step and just
create a file in the `_posts` directory yourself following this basic
structure::

  ---
  title: Hello, World!
  permalink: http://www.blogofile.com/blog/2011/04/18/hello-world
  date: 2011/04/18 23:16:08
  categories: 
  guid: MOc_DCw_CIgmXZ2WtMc81ywdFng=
  ---
  Hello, This is my first blog post.

All blog posts start with a header format called `YAML
<http://www.yaml.org/spec/1.2/spec.html>`_. Basically it's just a list
of settings for a blog post; setting the title, permalink URL, date,
categories and whatever else you want to attatch to the post. Other
than a few reserved words, all of these fields are free-form; you can
add whatever fields you wish.

The YAML header is demarcated by three dashes. After the second set of
dashes begins the content of your blog post ("Hello, This is my first blog post.")

Blog posts can be written in HTML, or alternatively in a markup
language like `markdown
<http://daringfireball.net/projects/markdown/>`_ or `reStructuredText
<http://docutils.sourceforge.net/rst.html>`_. The format of the post is
determined by the file extension of the post (.html, .markdown, .rst,
.textile)

Once you've finished writing your post, you need to rebuild your
website to see the change::

  blogofile build


