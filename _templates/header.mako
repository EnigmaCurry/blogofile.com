<% import urlparse %>
<div id="header" onclick="location.href='/';" style="cursor: pointer;">
  <div id="plugbanner"></div>
  <div id="blog_logo"></div>
  <h1><a href="/">
      <span id="blog_name">
        ${config.blog_name}
      </span>
    </a>
  </h1>
</div>
<a href="http://github.com/EnigmaCurry/blogofile"><img style="position: absolute; top: 0; right: 0; border: 0;" src="http://s3.amazonaws.com/github/ribbons/forkme_right_darkblue_121621.png" alt="Fork me on GitHub" /></a>
<div id="top_bar">
  <div class="ButtonBar">
    <ul>
      <li><a href="/">Home</a></li>
      <li><a href="/documentation">Documentation</a></li>
      <li><a href="/community">Community</a></li>
      <li><a href="${config.util.blog_path_helper('')}">Blog</a></li>
    </ul>
  </div>
  <div id="search">    
    <form id="searchform" method="get" action="http://www.google.com/search">
      <input type="hidden" name="ie" value="UTF-8">
      <input type="hidden" name="oe" value="UTF-8">
      <input type="hidden" name="domains" value="${urlparse.urlparse(config.blog_url)[1]}">
      <input type="hidden" name="sitesearch" value="${urlparse.urlparse(config.blog_url)[1]}">
      <input name="q" id="q" size="20" value="search in blog..." onfocus="if(this.value==this.defaultValue) this.value='';" type="text">
    </form>
  </div>
</div>
