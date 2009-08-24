<div id="right_sidebar">
  <div id="contact">
  <h3>Contact</h3>
  Blogofile is written by <a href="http://www.enigmacurry.com" rel="external" target="_blank">Ryan McGuire</a>
  <br/><br/> 
  Please send technical questions to the <br/><a href="http://groups.google.com/group/blogofile-discuss">mailing list</a>. Or, if you need to contact me privately, you can <a href="http://mailhide.recaptcha.net/d?k=01VHGYFI7WE9jB_dHebD-0JQ==&c=3qCKNvkRgZtCa5B5PJcptJVgaDI5-xiMjUjHgQi3vIw=">send email</a>.
  </div>
  <div id="blog_post_list">
  <h3>Latest blog posts</h3>
  <ul>
% for post in posts[:5]:
    <li><a href="${post.path}">${post.title}</a></li>
% endfor
  </ul>
  </div>
  <div id="on_twitter">
    <h3>On Twitter <small>the good, the bad, and the ugly</small></h3>
    <div id="blogofile_tweets"></div>
    <a href="http://search.twitter.com/search?q=blogofile" style="float: right">See more tweets</a>
  </div>
  <div id="categories">
    <h3>Categories</h3>
    <ul>
% for category, num_posts in all_categories:
     <li><a href="${category.path}">${category}</a> (<a href="${category.path}/feed">rss</a>) (${num_posts})</li>
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
