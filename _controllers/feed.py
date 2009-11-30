from blogofile.cache import bf

def run():
    write_feed(bf.posts, bf.util.path_join(bf.config.blog_path,"feed"), "rss.mako")
    write_feed(bf.posts, bf.util.path_join(bf.config.blog_path,"feed","atom"),
                          "atom.mako")

def write_feed(posts, root, template):
    root = root.lstrip("/")
    feed_template = bf.writer.template_lookup.get_template(template)
    feed_template.output_encoding = "utf-8"
    xml = bf.writer.template_render(feed_template,{"posts":posts,"root":root})
    try:
        bf.util.mkdir(bf.util.path_join(bf.writer.output_dir,root))
    except OSError:
        pass
    d = bf.util.path_join(bf.writer.output_dir,root)
    bf.util.mkdir(d)
    path = bf.util.path_join(d,"index.xml")
    bf.logger.info("Writing RSS/Atom feed: "+path)
    f = open(path,"w")
    f.write(xml)
    f.close()
