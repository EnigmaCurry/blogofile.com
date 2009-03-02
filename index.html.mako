<%inherit file="_templates/site.mako" />
<div class="blog_post">
  <span class="post_prose">
    
    <h1>Welcome to Blogofile.</h1>
    
    <ul>
      <li><b>Definition: <em>Blogophile</em> --</b><br/>
        A person who is fond of or obsessed with blogs or blogging.</li>
      <li><b>Definition: <em>Blogofile</em>  --</b><br/>
        A static file blog engine/compiler, inspired by <a href="http://github.com/mojombo/jekyll/tree/master">Jekyll</a>.</li>
    </ul>


    <p>Blogofile is a simple blog engine that requires no database and no special hosting environment. It's all just plain HTML. 
    </p>
    
    <p>Blogofile itself is run from your desktop computer, not on any server. You customize a set of templates with <a href="http://www.makotemplates.org">Mako</a>, create posts in a markup language like <a href="http://textile.thresholdstate.com/">Textile</a>, or <a href="http://daringfireball.net/projects/markdown/">Markdown</a>, (or even plain HTML) and Blogofile generates your entire blog as plain HTML, CSS, images, and Atom/RSS feeds which you can then upload to any old web server you like. No CGI or scripting environment is needed on the server.</p>
    <h3>Features</h3>

    <ul>
      <li>Blogofile is <b><i>free software</i></b>, read the <a href="http://github.com/EnigmaCurry/blogofile/blob/master/LICENSE.txt">public domain license</a>.
      <li>
        Blogofile is <b><i>fast</i></b>, the server doesn't need to do any database lookups or any template rendering.
      </li>
      <li>Blogofile is <b><i>inexpensive</i></b> to host. Any HTTP web server can host a blogofile blog.</li>
      <li>Blogofile is <b><i>modern</i></b>, supporting all the common blogging features:
        <ul>
          <li>Categories</li>
          <li>Tags</li>
          <li>Comments and Trackbacks (with an external host like <a href="http://www.disqus.com">Disqus</a> or <a href="http://www.intensedebate.com">IntenseDebate</a>)</li>
          <li>RSS and Atom feeds, one for all your posts, as well one per category.</li>
        </ul>
      <li><a href="/using_blogofile_with_git.html">Automatic deployment with git</a></li>
    </ul>
    <h3>Get Blogofile</h3>
    
    Make sure you have <a href="http://www.python.org">Python</a> and Setuptools installed. On Ubuntu you just need to run:
    
    <pre>sudo apt-get install python-setuptools</pre> 

    And install Blogofile with:
    
    <pre>easy_install Blogofile</pre>
    
    Here's the latest "stable" tarballed release:
    <ul>
      <li><a href="http://github.com/EnigmaCurry/blogofile/tarball/0.2">Blogofile 0.2.tar.gz</a></li>
    </ul>
    You can get the latest source from github:
    <pre>git clone git://github.com/EnigmaCurry/blogofile.git</pre>
    
    <h3>Using Blogofile</h3>
    See <a href="/using_blogofile.html">instructions here</a>.

  </span>
</div>

<%def name="sidebar()">
<h3>Latest blog posts:</h3>
<ul>
% for post in posts[:5]:
  <li><a href="${post.permalink}">${post.title}</a></li>
% endfor
</ul>
</%def>
