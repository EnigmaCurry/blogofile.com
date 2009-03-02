

<p id="credits">
Powered by <a href="http://www.blogofile.com">Blogofile</a>.<br/>
<br/>
RSS feeds for <a href="${config.get('blogofile','blog_url')}/feed/">Entries</a> and <a href="http://${config.get('blogofile','disqus_name')}.disqus.com/latest.rss">Comments</a>.
<br>
</p>

<script type="text/javascript">
//<![CDATA[
(function() {
		var links = document.getElementsByTagName('a');
		var query = '?';
		for(var i = 0; i < links.length; i++) {
			if(links[i].href.indexOf('#disqus_thread') >= 0) {
				query += 'url' + i + '=' + encodeURIComponent(links[i].href) + '&';
			}
		}
		document.write('<script charset="utf-8" type="text/javascript" src="http://disqus.com/forums/${config.get('blogofile','disqus_name')}/get_num_replies.js' + query + '"></' + 'script>');
	})();
//]]>
</script>
