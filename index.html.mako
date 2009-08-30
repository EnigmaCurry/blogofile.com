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


    <p>Blogofile is a simple blog engine that requires no database and no special hosting environment. You customize a set of templates with <a href="http://www.makotemplates.org">Mako</a>, create posts in a markup language of your choice (see <a href="/documentation/file_overview.html#post-content">Post Content</a>) and Blogofile renders your entire blog as static HTML and Atom/RSS feeds which you can then upload to any old web server you like.</p>
    
    <p>No CGI or scripting environment is needed on the server.</p>
    <h3>Why you should use Blogofile</h3>

    <ul>
      <li>Blogofile is <b><i>free software</i></b>, released under a non-enforced <a href="/LICENSE.html">MIT license</a>.
      <li>
        Blogofile is <b><i>fast</i></b>, the server doesn't need to do any database lookups nor any template rendering.
      </li>
      <li>Blogofile is <b><i>inexpensive</i></b> to host. Any web server can host a blogofile blog.</li>
      <li>Blogofile is <b><i>modern</i></b>, supporting all the common blogging features:
        <ul>
          <li>Categories.</li>
          <li>Tags.</li>
          <li>Comments and Trackbacks with effective spam filtering using <a href="http://www.disqus.com">Disqus</a>. (Sorry no pingback support.. yet.)</li>
          <li>RSS and Atom feeds, one for all your posts, as well as one per category.</li>
          <li><a href="/demo/sample_posts.html#Test%20syntax%20highlighting">Syntax highlighting</a> for source code listings.</li>
        </ul>
      <li>Blogofile is <b><i>secure</i></b>, there's nothing executable on the server.</li>
      <li>Blogofile works <b><i>offline</i></b>, with a built-in webserver you can work on your site from anywhere.
      <li>Blogofile is <b><i>file based</i></b>, so you can edit it with your favorite text editor, not some crappy web interface.</li>
      <li>Seamless <a href="/documentation/vcs_integration.html">Git Integration.</a> Publish to your blog with a simple "git push". This also makes <b><i>backups</i></b> dirt simple.</li> </li>
    </ul>
    <h3>Get Blogofile</h3>
    <p>
      Blogofile is still under development, and should be considered beta software at the moment, but should be usable even before the 1.0 release.
    </p>
    <p>
      Make sure you have <a href="http://www.python.org">Python</a> and <a href="http://pypi.python.org/pypi/setuptools">Setuptools</a> installed. On Ubuntu you just need to run:
    </p>
    <pre>sudo apt-get install python-setuptools</pre> 

    Download and install Blogofile with:
    
    <pre>sudo easy_install Blogofile</pre>
    
    Alternatively, here's the latest "stable" zipped release:
    <ul>
      <li><a href="${config.release_download_link}">Blogofile 0.5.zip</a></li>
    </ul>
    You can also get the latest development source from github:
    <pre>git clone git://github.com/EnigmaCurry/blogofile.git</pre>
    <br/>
  </span>
</div>

