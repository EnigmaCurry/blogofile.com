<div id="right_sidebar">
  <h3>Contact</h3>
  <a href="http://www.enigmacurry.com" rel="external" target="_blank">Ryan McGuire</a> wrote Blogofile. 
  <br/><br/> You can <a href="http://mailhide.recaptcha.net/d?k=01VHGYFI7WE9jB_dHebD-0JQ==&c=3qCKNvkRgZtCa5B5PJcptJVgaDI5-xiMjUjHgQi3vIw=" rel="external" target="_blank">contact him here</a>
  <br/><br/>
  <h3>Latest blog posts:</h3>
  <ul>
% for post in posts[:5]:
    <li><a href="${post.permalink}">${post.title}</a></li>
% endfor
  </ul>
</div>
