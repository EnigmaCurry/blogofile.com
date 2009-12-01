from blogofile.cache import bf

def run():
    write_feed(bf.posts, bf.util.path_join(bf.config.blog_path,"feed"), "rss.mako")
    write_feed(bf.posts, bf.util.path_join(bf.config.blog_path,"feed","atom"),
                          "atom.mako")

def write_feed(posts, root, template):
    root = root.lstrip("/")
    path = bf.util.path_join(root,"index.xml")
    bf.logger.info("Writing RSS/Atom feed: "+path)
    bf.writer.materialize_template(template, path, {"posts":posts, "root":root})
