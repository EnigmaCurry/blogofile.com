<%page args="post"/>
<div class="blog_post">
  <a name="${post.title}" />
  <h2 class="blog_post_title"><a href="${post.permapath()}" rel="bookmark" title="Permanent Link to ${post.title}">${post.title}</a></h2>
  <small>${post.date.strftime("%B %-d, %Y at %-I:%M %p")} | categories: 
<% 
   category_links = []
   for category in post.categories:
       if post.draft:
           #For drafts, we don't write to the category dirs, so just write the categories as text
           category_links.append(category)
       else:
           category_links.append("<a href='/category/%s'>%s</a>" % (category_link_names[category], category))
%>
${", ".join(category_links)} | <a href="${post.permalink}#disqus_thread">View Comments</a>
</small><p/>
  <span class="post_prose">
    ${post.content}
  </span>
</div>
