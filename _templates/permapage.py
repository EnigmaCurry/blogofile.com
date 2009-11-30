import urlparse
from blogofile.cache import bf

def run():
    write_permapages()

def write_permapages():
    "Write blog posts to their permalink locations"
    perma_template = bf.writer.template_lookup.get_template("permapage.mako")
    perma_template.output_encoding = "utf-8"
    for post in bf.posts:
        if post.permalink:
            path_parts = [bf.writer.output_dir]
            path_parts.extend(urlparse.urlparse(
                    post.permalink)[2].lstrip("/").split("/"))
            path = bf.util.path_join(*path_parts)
            bf.logger.info("Writing permapage for post: "+path)
        else:
            #Permalinks MUST be specified. No permalink, no page.
            bf.logger.info("Post has no permalink: "+post.title)
            continue
        try:
            bf.util.mkdir(path)
        except OSError:
            pass
        html = bf.writer.template_render(
            perma_template,
            { "post": post,
              "posts": bf.posts })
        f = open(bf.util.path_join(path,"index.html"), "w")
        f.write(html)
        f.close()
