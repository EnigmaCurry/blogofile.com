<div id="right_sidebar">
  <h3>Latest blog posts:</h3>
  <ul>
% for post in posts[:5]:
    <li><a href="${post.permalink}">${post.title}</a></li>
% endfor
  </ul>
</div>
