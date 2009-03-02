<%inherit file="_templates/site.mako" />
<div class="blog_post">
  <span class="post_prose">
    
    <h1>Welcome to Blogofile.</h1>
    
    <p>Blogofile is a simple blog engine that requires no database and no special hosting environment. It's all just plain HTML. 
    </p>
    
    <p>Blogofile itself is only run from your desktop computer. You customize a set of templates with <a href="http://www.makotemplates.org">Mako</a>, create posts in a markup language like <a href="http://textile.thresholdstate.com/">Textile</a>, or <a href="http://daringfireball.net/projects/markdown/">Markdown</a>, (or even plain HTML) and Blogofile generates your entire blog as plain HTML, CSS, images, and Atom/RSS feeds which you can then upload to any old web server you like. No CGI or scripting environment is needed on the server.</p>
    <h3>Features</h3>

    <ul>
      <li>Blogofile is <b><i>free software</i></b>, read the <a href="http://github.com/EnigmaCurry/blogofile/blob/master/LICENSE.txt">public domain license</a>.
      <li>
        Blogofile is <b><i>fast</i></b>, the server doesn't need to do any database lookups or any template rendering.
      </li>
      <li>Blogofile is <b><i>inexpensive</i></b> to host. Any HTTP web server can host a blogofile blog.</li>
      <li>Blogofile is <b><i>modern</i></b>, supporting all the common blogging features:
        <ul>
          <li>Categories</li>
          <li>Tags</li>
          <li>Comments and Trackbacks (with an external host like <a href="http://www.disqus.com">Disqus</a> or <a href="http://www.intensedebate.com">IntenseDebate</a>)</li>
          <li>RSS and Atom feeds, one for all your posts, as well one per category.</li>
        </ul>
    </ul>
    <h3>Get Blogofile</h3>
    
    Assuming you already have <a href="http://www.python.org">Python</a> and Setuptools already installed, just run:
    
    <pre>easy_install Blogofile</pre>
    
    Here's the latest "stable" tarballed release:
    <ul>
      <li><a href="http://github.com/EnigmaCurry/blogofile/tarball/0.2">Blogofile 0.2.tar.gz</a></li>
    </ul>
    You can get the latest source from git:
    <pre>git clone git://github.com/EnigmaCurry/blogofile.git</pre>
    
    <h3>Using Blogofile</h3>
    
    <h4>Getting a sample site</h4>
    The easiest way to start using Blogofile is to checkout an existing blogofile based blog. This website, in fact, is entirely generated via Blogofile, so let's checkout the source for this website using git:

    <pre>git clone git://github.com/EnigmaCurry/blogofile.com.git</pre>

    The blogofile.com directory is our "source" directory. This directory conains all of the files that will make up our website in addition to some special files that help blogofile along the way. A point of clarification is in order though, the source directory is <b><em>not</em></b> the website, we generate the website <b><em>from</em></b> the source directory to create a new directory called "_site"

    <h4>Directory structure</h4>
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
      <li>Any file or directory starting with an underscore ("_") is considered special by blogofile and is not copied to "_site".</li>
      <li>Any file ending in ".mako" is processed by mako before being copied to "_site". The file in "_site" is stripped of the ".mako" extension.</li>
      <li>Special folders used by revision control systems, such as ".git", ".svn", ".hg", ".bzr", and ".CVS" are ignored.</li>
      <li>Any other file or directory is considered to be part of the regular website, and is copied over to "_site" directly.</li>
    </ul>

    <h4>Building the site</h4>
    When in the blogofile.com directory build the site:
    <pre>blogofile -b</pre>
    
    You'll see in _site the completely built website. If you copied the _site  directory to a webserver, you'd be hosting an exact copy of the site you're reading now.

    <h4>_posts</h4>
    By convention, the _posts directory is where all your posts go, one post per file. Posts can currently be written in plain HTML or <a href="http://textile.thresholdstate.com/">Textile</a>. Each post also has some metadata that blogofile uses when it renders your posts. This Metadata is placed at the top of the file in YAML syntax, for example:
<pre>---
title: This is the title of the post
categories: Cool Stuff, Random Stuff
date: 2009/03/02 13:09:00
format: html
permalink: http://www.blogofile.com/2009/03/02/this-is-the-title-of-the-post
tags: 
---
This is the text of the post.</pre>

    You can use any of the following metadata values:
    <ul>
      <li>title</li>
      <ul><li>This is the title of the post</li></ul>
      <li>categories</li>
      <ul><li>This is a list of the categories the post is a part of, seperated by commas</li></ul>
      <li>tags</li>
      <ul><li>This is a list of the tags for the post, seperated by commas</li></ul>
      <li>date</li>
      <ul><li>The date of the post</li></ul>
      <li>updated</li>
      <ul><li>The date the post was last updated</li></ul>
      <li>format</li>
      <ul><li>the format of the post, 'html' or 'textile'.</li></ul>
      <li>permalink</li>
      <ul><li>The full permalink to the post</li></ul>
      <li>guid</li>
      <ul><li>An optional guid to use in RSS/Atom feeds. The permalink is used by default.</li></ul>
    </ul>

    <h4>_config.cfg</h4>
    The _config.cfg file is the main configuartion file for your blogofile based site. It has a number of options you'll want to specify:
    <ul>
      <li>blog_name</li>
      <ul>
        <li>This is the name of your blog, by default it appears in the title as well as the top of your website</li>
      </ul>
      <li>blog_url</li>
      <ul><li>The full URL of your website</li></ul>
      <li>blog_description</li>
      <ul><li>A short one line description of your site, this goes into RSS feeds</li></ul>
      <li>timezone</li>
      <ul><li>Specify the timezone you wish your posts to appear as, this makes it so you don't have to type it in your posts everytime</li></ul>
      <li>disqus_name</li>
      <ul><li>If you have setup a <a href="http://www.disqus.com">Disqus</a> account for comments on your site, this is the name of the account</li></ul>
      <li>pretty_html</li>
      <ul><li>With this enabled, you can make your site's source code really pretty using <a href="http://www.crummy.com/software/BeautifulSoup/">BeautifulSoup</a>, but it's slow, and it also messes up &lt;pre&gt; tags, so it's turned off by default.</li></ul>
    </ul>

  </span>
</div>

<%def name="sidebar()">
<h3>Latest blog posts:</h3>
<ul>
% for post in posts[:5]:
  <li><a href="${post.permalink}">${post.title}</a></li>
% endfor
</ul>
</%def>
