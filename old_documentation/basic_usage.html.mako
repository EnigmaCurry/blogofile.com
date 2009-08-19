<%inherit file="_templates/site.mako" />
<div class="blog_post">
  <span class="post_prose">
    <h1>Using Blogofile</h1>
    <h3>Getting a sample site</h3>
    <p>The easiest way to start using Blogofile is to checkout an existing blogofile based blog, compile it to see how it works, create your own posts, and then eventually start customizing it for yourself. This website, in fact, is entirely generated via Blogofile, so let's checkout the source for this website using git:</p>

    <pre>git clone git://github.com/EnigmaCurry/blogofile.com.git</pre>
    <small>(alternatively, here's <a href="http://github.com/EnigmaCurry/blogofile.com/zipball/master">the latest zipped version</a>)</small>

    <p>The blogofile.com directory is our "source" directory. This directory contains all of the files that will make up our website, as well as some special files that will help blogofile along the way. A point of clarification is in order though, the source directory is <b><em>not</em></b> the website, we will generate the website <b><em>from</em></b> the source directory to create a new directory called "_site" which will then contain the raw HTML source for the website.</p>

    <h3>Directory structure</h3>
    <p>
    The blogofile.com directory looks like this:
<pre>blogofile.com/
|-- _config.cfg
|-- _posts
|   `-- 001. Blogofile 0.1.textile
|-- _site
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
|-- css
|   `-- site.css
|-- index.html.mako
|-- js
`-- site_img
    |-- bg.gif
    |-- blockquote.png
    `-- dot.gif</pre>
    </p>
    Blogofile uses a few simple rules in determining what ends up on the website:
    <ul>
      <li>Any file or directory starting with an underscore ("_") is considered special by blogofile and is not copied to "_site". By convention, this includes _templates and _posts.</li>
      <li>Any file ending in ".mako" outside of an underscored directory, is processed by mako before being copied to "_site". The file in "_site" is then stripped of the ".mako" extension.</li>
      <li>Special folders used by revision control systems, such as ".git", ".svn", ".hg", ".bzr", and "CVS" are ignored.</li>
      <li>Any other file or directory is considered to be part of the regular website, and is copied over to "_site" directly.</li>
    </ul>

    <h3>Building the site</h3>
    Go to the root of the blogofile.com directory and build the site:
    <pre>blogofile -b</pre>
    
    If everything went well, you won't see any output on the screen, but you'll see that the "_site" directory contains the completely built website. If you now copy the "_site"  directory to a webserver, you'll be hosting an exact copy of the site you're reading now.

    <h3>_posts</h3>
    By convention, the _posts directory is where all your posts go, one post per file. Posts can currently be written in plain HTML, <a href="http://daringfireball.net/projects/markdown/">Markdown</a> or <a href="http://textile.thresholdstate.com/">Textile</a>. Each post also has some metadata that blogofile uses when it renders your posts. This Metadata is placed at the top of the file in YAML syntax, for example:
<pre>---
title: This is the title of the post
categories: Cool Stuff, Random Stuff
date: 2009/03/02 13:09:00
format: html
permalink: http://www.blogofile.com/2009/03/02/this-is-the-title-of-the-post
tags: random, cool
---
This is the text of the post.</pre>

    You can use any of the following metadata values:
    <ul>
      <li><b>title</b></li>
      <ul><li>This is the title of the post</li></ul>
      <li><b>categories</b></li>
      <ul><li>This is a list of the categories the post is a part of, seperated by commas</li></ul>
      <li><b>tags</b></li>
      <ul><li>This is a list of the tags for the post, seperated by commas</li></ul>
      <li><b>date</b></li>
      <ul><li>The date of the post</li></ul>
      <li><b>updated</b></li>
      <ul><li>The date the post was last updated</li></ul>
      <li><b>format</b></li>
      <ul><li>the format of the post, 'html', 'markdown', or 'textile'. </li></ul>
      <li><b>permalink</b></li>
      <ul><li>The full permalink to the post</li></ul>
      <li><b>guid</b></li>
      <ul><li>An optional guid to use in RSS/Atom feeds. The permalink is used by default.</li></ul>
    </ul>

    <h3>_config.cfg</h3>
    The _config.cfg file is the main configuartion file for your blogofile based site. It has a number of options you'll want to specify:
    <ul>
      <li><b>blog_name</b></li>
      <ul>
        <li>This is the name of your blog, by default it appears in the title as well as the top of your website</li>
      </ul>
      <li><b>blog_url</b></li>
      <ul><li>The full URL of your website homepage</li></ul>
      <li><b>blog_description</b></li>
      <ul><li>A short one line description of your site, this goes into RSS feeds</li></ul>
      <li><b>timezone</b></li>
      <ul><li>Specify the timezone you wish your posts to appear as, this makes it so you don't have to type it in your posts everytime</li></ul>
      <li><b>disqus_name</b></li>
      <ul><li>If you have setup a <a href="http://www.disqus.com">Disqus</a> account for comments on your site, this is the name of the account</li></ul>
      <li><b>pretty_html</b></li>
      <ul><li>With this enabled, you can make your site's source code really pretty using <a href="http://www.crummy.com/software/BeautifulSoup/">BeautifulSoup</a>, but it's slow, and it also messes up &lt;pre&gt; tags, so it's turned off by default.</li></ul>
    </ul>

    <h3>_templates</h3>
    The "_templates" directory contains many of the templates used for the site, although unlike templates outside of this directroy, none of these templates correspond to a specific page. These are reusable templates to render many pages. Here's a description of each:

    <ul>
      <li>base.mako - the base template that establishes the general look of the entire site.</li>
      <li>site.mako - an optional template that further extends base.mako</li>
      <li>head.mako - the &lt;head&gt; tag area of the site.</li>
      <li>header.mako - the top portion of the site, that's on every page.</li>
      <li>footer.mako - the bottom portion of the site, that's on every page.</li>
      <li>post.mako - defines what a single blog post looks like</li>
      <li>permapage.mako - defines the permalink page for a post, including comments section</li>
      <li>chronological.mako - the template that renders a chronological rendering of blog entries</li>
      <li>sidebar.mako - defines the sidebar on the site</li>
      <li>atom.mako - Atom feed</li>
      <li>rss.mako - RSS feed</li>
    </ul>
    <p>You can read more about <a href="/documentation/templates.html">creating your own templates here</a>.</p>
    <h3>Autodeployment with Git</h3>
    Git can do <a href="/documentation/usage_with_git.html">automatic deployment</a> to your webserver.
  </span>
</div>
