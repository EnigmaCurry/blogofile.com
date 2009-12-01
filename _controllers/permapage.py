import urlparse
from blogofile.cache import bf

def run():
    write_permapages()

def write_permapages():
    "Write blog posts to their permalink locations"
    for post in bf.posts:
        if post.permalink:
            path = urlparse.urlparse(
                post.permalink)[2].lstrip("/").split("/")
            path = bf.util.path_join(path)
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
        
