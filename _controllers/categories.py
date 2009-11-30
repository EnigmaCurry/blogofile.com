import os
import shutil
from blogofile.cache import bf

def run():
    write_categories()

def write_categories():
    """Write all the blog posts in categories"""
    root = bf.util.path_join(bf.blog_dir,bf.config.blog_category_dir)
    chron_template = bf.writer.template_lookup.get_template("chronological.mako")
    chron_template.output_encoding = "utf-8"
    #Find all the categories:
    categories = set()
    for post in bf.posts:
        categories.update(post.categories)
    for category in categories:
        category_posts = [post for post in bf.posts \
                              if category in post.categories]
        #Write category RSS feed
        bf.controllers.feed.write_feed(category_posts,bf.util.path_join(
                bf.config.blog_path, bf.config.blog_category_dir,
                category.url_name,"feed"),"rss.mako")
        bf.controllers.feed.write_feed(category_posts,bf.util.path_join(
                bf.config.blog_path, bf.config.blog_category_dir,
                category.url_name,"feed","atom"),"atom.mako")
        page_num = 1
        while True:
            path = bf.util.path_join(root,category.url_name,
                                str(page_num),"index.html")
            try:
                bf.util.mkdir(os.path.split(path)[0])
            except OSError:
                pass
            f = open(path, "w")
            page_posts = category_posts[:bf.config.blog_posts_per_page]
            category_posts = category_posts[bf.config.blog_posts_per_page:]
            #Forward and back links
            if page_num > 1:
                prev_link = bf.util.path_join(
                    bf.config.blog_path, bf.config.blog_category_dir, category.url_name,
                                           str(page_num - 1))
            else:
                prev_link = None
            if len(category_posts) > 0:
                next_link = bf.util.path_join(
                    bf.config.blog_path, bf.config.blog_category_dir, category.url_name,
                                           str(page_num + 1))
            else:
                next_link = None
            html = bf.writer.template_render(
                chron_template,
                { "posts": page_posts,
                  "prev_link": prev_link,
                  "next_link": next_link })
            f.write(html)
            f.close()
            #Copy category/1 to category/index.html
            if page_num == 1:
                shutil.copyfile(path,bf.util.path_join(
                        root,category.url_name,
                        "index.html"))
            #Prepare next iteration
            page_num += 1
            if len(category_posts) == 0:
                break
