.. _filters:

Filters
******************************
Filters are Blogofile's text processor plugin system. They create callable functions in templates and blog posts that can perform manipulation on a block of text. Ideas for filters:

* A swear-word filter.
* A flash video plugin helper.
* A new markup language.
* A foreign language translator.

.. _filter-simple-example:

A Simple Filter
---------------

The simplest example is probably a swear word filter, called ``_filters/playnice.py``::

 #Replace objectionable language with kittens.
 #This is just an example, it's far from exhaustive.
 import re

 seven_words = re.compile(
   r"\Wfrak\W|\Wsmeg\W|\Wjoojooflop\W|\Wswut\W|\Wshazbot\W|\Wdoh\W|\Wgorram\W|\Wbelgium\W",
   re.IGNORECASE)

 def run(content):
     return seven_words.sub(" kitten ", content)

This filter (once it's in your ``_filters`` directory) is available to all templates and blog posts.

How to use it in a template::

 <%self:filter chain="playnice">Belgium: Less offensive words have been created 
   in the many languages of the galaxy, such as joojooflop, swut and 
   Holy Zarquon's Singing Fish. </%self:filter>

**Blogofile currently does not have a common interface for applying filters in blog posts, this is forthcoming.**
