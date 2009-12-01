.. _controllers:

Controllers
******************************

Controllers are used when you want to create a whole chunk of your site dynamically everytime you compile your site. The best example of this is a blog. The whole purpose of a blog engine is to make it so you don't have to update 10 different things when you just want to make a post. Examples of controllers include:

 * A sequence of blog posts listed in reverse chronological order paginated 5 posts per page.
 * A blog post archiver to list blog posts in reverse chronological order listed by year and month.
 * A blog post categorizer to list blog posts in reverse chronological order listed by category.
 * An RSS/Atom feed generator for all posts, or for a single category.
 * A permalink page for all blog posts

All of these are pretty much a necessity for a blog engine, but none of these are included within the core of Blogofile itself. One of Blogofile's core principles is to remain light, configurable, and to make little assumption about how a user's site should behave. All of these blog specific tasks are relegated to a type of plugin system called controllers so that they can be tailored to each individuals tastes as well as leave room for entirely new types of controllers written by the user.

The blogofile.com sources (which you can obtain by running ``blogofile init blogofile.com``) include all of these controllers in the ``_controllers`` directory. But let's look at a much simpler example for the purposes of this tutorial.

.. _controller-simple-example:

A Simple Controller
-------------------

Suppose you wanted to create a simple photo gallery with a comments page for each photo. You don't want to have to create a new mako template for every picture you upload, so let's write a controller instead:
