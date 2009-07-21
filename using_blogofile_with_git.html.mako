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
    Automatic wha?
    <br/><br/>
    Yes, you can have git run "blogofile -b" automatically when you 'git push' your site. This only works if the site hosting your website is also the same site that you 'git push' to<sup><b>*</b></sup>. Here's how to make it work:
    <br/>
    <ul>
      <li>Check out your project on the same server where your git repository is located
        <pre>git clone /path/to/your_repo.git /path/to/website</pre>
      </li>
      <li>Create a new "post-receive" hook in your git repo, create the file /path/to/your_repo.git/hooks/post-receive to look like the following:
<pre>#!/bin/sh

#Rebuild the blog
unset GIT_DIR
cd /path/to/your/website
git pull
blogofile -b</pre>
      </li>
    </ul>
    <br/>
    
    Now whenever you "git push" to your webhost, your website gets automatically rebuilt.<br/><br/>
    
    <small><b>* - if you deploy to a different server than your git repo, you could just craft your own scp/FTP command and put it at the bottom of the post-receive hook to deploy somewhere else. But that's beyond the scope of this article</b></small>
  </span>
</div>
