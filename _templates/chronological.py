# Write all the blog posts in reverse chronological order
import os
from blogofile.cache import bf

def run():
    write_blog_chron(posts=bf.posts,
                     root=bf.config.blog_pagination_dir.lstrip("/"))
    write_blog_first_page()

def write_blog_chron(posts,root):
    chron_template = bf.writer.template_lookup.get_template("chronological.mako")
    chron_template.output_encoding = "utf-8"
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
        page_dir = bf.util.path_join(bf.blog_dir,root,str(page_num))
        bf.util.mkdir(page_dir)
        fn = bf.util.path_join(page_dir,"index.html")
        f = open(fn,"w")
        html = bf.writer.template_render(
            chron_template,
            { "posts":page_posts,
              "next_link":next_link,
              "prev_link":prev_link })
        f.write(html)
        f.close()
        page_num += 1
        
def write_blog_first_page():
    if not bf.config.blog_custom_index:
        chron_template = bf.writer.template_lookup.get_template("chronological.mako")
        chron_template.output_encoding = "utf-8"
        page_posts = bf.posts[:bf.config.blog_posts_per_page]
        path = bf.util.path_join(bf.blog_dir,"index.html")
        bf.logger.info("Writing blog index page: "+path)
        f = open(path,"w")
        if len(bf.posts) > bf.config.blog_posts_per_page:
            next_link = bf.util.blog_path_helper(bf.config.blog_pagination_dir+"/2")
        else:
            next_link = None
        html = bf.writer.template_render(
            chron_template,
            { "posts": page_posts,
              "next_link": next_link,
              "prev_link": None })
        f.write(html)
        f.close()          
