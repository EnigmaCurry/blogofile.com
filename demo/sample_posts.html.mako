<%inherit file="_templates/site.mako" />
<div class="blog_post">
  <span class="post_prose">
    <h1>Sample Posts</h1>
    This page shows many of the features that blogofile supports on the post level. For each example, the HTML rendering is shown first and secondly the source used to render it.
% for p in config.post.parse_posts("_sample_posts"):
  <% p.draft = True %>
  <%include file="post.mako" args="post=p" />
    <h3>Source:</h3>
    <pre>${config.util.html_escape(p.source)}</pre>
% endfor
  </span>
</div>
