<%inherit file="_templates/site.mako" />
<div class="blog_post">
  <span class="post_prose">
    <h1>Using Blogofile with Git</h1>
    Managing your blog with <a href="http://git-scm.com">git</a> is ideal. Consider the features:
    <br/>
    <ul>
      <li>Regular backups of your site happen everytime you 'git push'</li>
      <li>You can look at the history of your blog, enabling you to see your edits of your posts</li>
      <li>Automatic deployment</li>
    </ul>   
    <br/>
    Automatic wha?
    <br/><br/>
    Yes, you can have git run "blogofile -b" automatically when you 'git push' your site. This only works if the site hosting your website is also the same site that you 'git push' to. Here's how to make it work:
    <br/>
    <ul>
      <li>Check out your project on the same server where your git repository is located
        <pre>git clone /path/to/repo /path/to/website</pre>
      </li>
    </ul>
    <br/>
    

    
  </span>
</div>
