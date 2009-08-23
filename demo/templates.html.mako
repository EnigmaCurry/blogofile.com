<%inherit file="_templates/site.mako" />
<div class="blog_post">
  <span class="post_prose">
    <h1>Templating in Blogofile</h1>
    <p>Templates are at the very heart of Blogofile; they control every aspect of how the blog looks. Blogofile uses the <a href="http://www.makotemplates.org/">Mako templating engine</a> which has a very active community and <a href="http://www.makotemplates.org/docs/">great documentation</a>. Blogofile doesn't try to limit what you can do with your templates, you've got the full power of Mako so go ahead and use it. This page will not attempt to rewrite the Mako documentation, but will instead try to document some typical use cases for templates in Blogofile.</p>
    <h2>A word on Blogofile templates</h2>
    <p>Blogofile makes a distinction between two different types of templates:</p>
    <ul>
      <li>Page templates</li>
      <li>Reusable templates</li>
    </ul>
    <p>A page template is a template somewhere in your directory structure called something like your_page.html.mako, this is considered to be a <em>single page</em> somewhere on your site. For instance <mono>/index.html.mako</mono> is the index page of your site. You would put things that you want to be only on your home page in this file.</p>
    <p>Reusable templates are templates that are in the <mono>/_templates</mono> directory. These templates are reused on multiple pages of your site, they do not correspond to any particular page, but are rather <a href="http://www.makotemplates.org/docs/inheritance.html">inherited</a> or <a href="http://www.makotemplates.org/docs/syntax.html#syntax_tags_include">included</a> inside of other templates.</p>
    <p>For example, this site has a header and a sidebar that appears on every single page of this site. They are included in the <mono>/_templates</mono> directory as <mono>header.mako</mono> and <mono>sidebar.mako</mono>, respectively. These are templates that you would likely <a href="http://www.makotemplates.org/docs/syntax.html#syntax_tags_include">include</a> in other templates. The <mono>/_templates/site.mako</mono> file is the base template for all pages on the entire site, this is a template that you would likely want other templates to <a href="http://www.makotemplates.org/docs/inheritance.html">inherit</a> from.</p>
    <h2>Template Variables</h2>
    <p>Blogofile provides to Mako several objects that become available for you to use in your templates:</p>
      <ul>
        <li><b><i>posts</i></b> - This is a list of all the blog post objects</li>
        <li><b><i>config</i></b> - This is the global blog config object as defined in <mono>/_config.cfg</mono></li>
        <li><b><i>archive_links</i></b> - Metadata for the archive links listed by month</li>
        <li><b><i>all_categories</i></b> - All the categories for the blog posts</li>
        <li><b><i>category_link_names</i></b> - A mapping of Category names to their URL friendly equivalents</li>
      </ul>
    <h2>Example 1: Post Lists</h2>
    <p>A typical thing you might want on a blog is a simple list of posts, if you only wanted this on one page, you could simply write a function inline on a regular page template:</p>
    <pre lang="html+mako">
      ${"""<h4>Welcome to my homepage</h4>
      Here's my latest 5 blog posts:
      <ul>
        % for p in posts[0:5]:
        <li><a href="${p.permalink}">${p.title}</a></li>
        % endfor
      </ul>"""}
    </pre>
    <p>This gets rendered as something like the following:</p>
    <div style="background-color:#ffffff; border:1px solid;">
      <h4>Welcome to my homepage</h4>
      Here's my latest 5 blog posts:
      <ul>
        % for p in posts[0:5]:
        <li><a href="${p.permalink}">${p.title}</a></li>
        % endfor
      </ul>
    </div>
    <p>To refine that to show posts on a per category basis you might try the following:</p>
    <pre lang="html+mako">
      ${"""<h4>Welcome to my homepage</h4>
      Here's the last 5 posts in each category:
      % for category in all_categories:
       Posts in category : ${category[0]}
       <ul>
         % for p in [p for p in posts if category[0] in p.categories][0:5]:
         <li><a href="${p.permalink}">${p.title}</a></li>
         % endfor
       </ul>
      % endfor
      """}
    </pre>
    <p>This gets rendered as something like the following:</p>
    <div style="background-color:#ffffff; border:1px solid;">
      <h4>Welcome to my homepage</h4>
      Here's the last 5 posts in each category:<br/><br/>
      % for category in all_categories:
      Posts in category : ${category[0]}
      <ul>
        % for p in [p for p in posts if category[0] in p.categories][0:5]:
        <li><a href="${p.permalink}">${p.title}</a></li>
        % endfor
      </ul>
      % endfor
    </div>
    <p>If this is a feature you want to be able to reuse, you can put this in it's own reusable template, eg: <mono>/_templates/category_list.mako</mono></p>
    <pre lang="html+mako">
      ${"""
      <%page args="posts, category"/>
      <h2>Posts in category : ${category}</h2>
      <ul>
        % for p in [p for p in posts if category in p.categories]:
        <li><a href="${p.permalink}">${p.title}</a></li>
        % endfor
      </ul>
      """}
    </pre>
    <p>The above template declares two input arguments: posts and category. You can include this template in other templates, making sure to include those arguments:</p>
    <pre lang="html+mako">
      ${"""
      % for category in all_categories:
      <%include file="_templates/category_list.mako" args="category=category[0]" />
      % endfor"""}
    </pre>
    <p>Note that the posts object, even though not explicitly passed in the include arguments, is passed automatically because all templates receive the posts object by default. If you wanted to limit the posts to the first 5 posts, you could put "posts=posts[0:5]" in the include args and it would supercede the regular posts object (which includes all posts).</p>
    <h2>More Examples</h2>
    I can provide more examples here if you request them on <a href="http://groups.google.com/group/blogofile-discuss">the mailing list</a>
  </span>
</div>
