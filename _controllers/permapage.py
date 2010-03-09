import urlparse
from blogofile.cache import bf
import re

def run():
    write_permapages()

def write_permapages():
    "Write blog posts to their permalink locations"
    site_re = re.compile(bf.config.site_url, re.IGNORECASE)
    for post in bf.posts:
        if post.permalink:
            path = site_re.sub("",post.permalink)
            bf.logger.info("Writing permapage for post: "+path)
        else:
            #Permalinks MUST be specified. No permalink, no page.
            bf.logger.info("Post has no permalink: "+post.title)
            continue
        try:
            bf.util.mkdir(path)
        except OSError:
            pass
        bf.writer.materialize_template(
            "permapage.mako", bf.util.path_join(path,"index.html"), 
            { "post": post, "posts": bf.posts })
