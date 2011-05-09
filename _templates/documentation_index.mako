<%inherit file="_templates/site.mako" />
<%def name="head()">
  <%include file="head.mako" />
  <style type="text/css">
    div.docs li {
      margin-top: 0.5em;
      font-size: 1.2em;
    }
    div.docs li li {
      font-size: 0.8em;
    }
  </style>
</%def>
<div class="blog_post">
  <span class="post_prose">
<%self:filter chain="markdown">
<div class="docs">

Documentation
=============

Rather than having a single large book, Blogofile documentation
is broken up into several smaller topical guides that should be
more easy to digest than a large self-referential tome.

The documents below are listed in a suggested order of reading,
however, each guide approaches their topic in a stand-alone
fashion and they will repeat concepts as necessary so as to
reinforce the material discussed.

Blogofile 0.8 (development)
---------------------------

 * [Quickstart Guide](/documentation/quickstart)
     * Covers Installation and creating a simple blog.
 * [Architecture](architecture)
     * Covers site configuration and introduces Controllers, Filters, Templates, and Plugins.</li>
 * [Blog Plugin](blog_plugin)
     * How to use Blogofile as a Blogging engine and migrating from other platforms.
 * [Themes and Site Design](themes_and_site_design)
     * Site styles and common patterns.
 * [Command line features](command_line)
     * Command line help and setting up BASH completion
 * [Plugin Development](plugin_development)
     * How to create and distribute your own plugins.
 * [Contributors Guide](contributers)
     * How you can contribute back to Blogofile.

Blogofile 0.7.1 (stable)
------------------------

 * [Blogofile 0.7.1 documentation](0.7.1)

</div>
</%self:filter>
</span>
</div>

