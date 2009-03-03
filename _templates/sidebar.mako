<div id="right_sidebar">
  <div id="contact">
  <h3>Contact</h3>
  Blogofile is written by<br/>
  <a href="http://www.enigmacurry.com" rel="external" target="_blank">Ryan McGuire</a>
  <br/><br/> You can <a href="http://mailhide.recaptcha.net/d?k=01VHGYFI7WE9jB_dHebD-0JQ==&c=3qCKNvkRgZtCa5B5PJcptJVgaDI5-xiMjUjHgQi3vIw=" rel="external" target="_blank">send questions here.</a>
  <br/><br/>
  </div>
  <div id="blog_post_list">
  <h3>Latest blog posts</h3>
  <ul>
% for post in posts[:5]:
    <li><a href="${post.permalink}">${post.title}</a></li>
% endfor
  </ul>
  </div>
  <div id="categories">			
    <h3>Categories</h3>    
    <ul>
% for category, num_posts in all_categories:
     <li><a href="/category/${category_link_names[category]}">${category}</a> (<a href="/category/${category_link_names[category]}/feed">rss</a>) (${num_posts})</li>
% endfor
    </ul>
  </div> 
  <div id="archives">			
    <h3>Archives</h3>
    <ul>
% for link, name, num_posts in archive_links:
      <li><a href="${link}" title="${name}">${name}</a>&nbsp;(${num_posts})</li>
% endfor
    </ul>
    
  </div>

</div>
