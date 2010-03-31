# Write all the blog posts in reverse chronological order
import os
from blogofile.cache import bf

def run():
    write_blog_chron(posts=bf.posts,
                     root=bf.config.blog_pagination_dir.lstrip("/"))
    write_blog_first_page()

def write_blog_chron(posts,root):
    page_num = 1
    post_num = 0
    html = []
    while len(posts) > post_num:
        #Write the pages, num_per_page posts per page:
        page_posts = posts[post_num:post_num+bf.config.blog_posts_per_page]
        post_num += bf.config.blog_posts_per_page
        if page_num > 1:
            prev_link = "../" + str(page_num - 1)
        else:
            prev_link = None
        if len(posts) > post_num:
            next_link = "../" + str(page_num + 1)
        else:
            next_link = None
        page_dir = bf.util.path_join(bf.config.blog_path,root,str(page_num))
        fn = bf.util.path_join(page_dir,"index.html")
        bf.writer.materialize_template("chronological.mako", fn,
            { "posts":page_posts,
              "next_link":next_link,
              "prev_link":prev_link })
        page_num += 1
        
def write_blog_first_page():
    if not bf.config.blog_custom_index:
        page_posts = bf.posts[:bf.config.blog_posts_per_page]
        path = bf.util.path_join(bf.config.blog_path,"index.html")
        bf.logger.info("Writing blog index page: "+path)
        if len(bf.posts) > bf.config.blog_posts_per_page:
            next_link = bf.util.site_path_helper(bf.config.blog_pagination_dir+"/2")
        else:
            next_link = None
        bf.writer.materialize_template("chronological.mako", path,
            { "posts": page_posts,
              "next_link": next_link,
              "prev_link": None })
