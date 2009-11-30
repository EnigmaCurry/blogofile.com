from blogofile.cache import bf

def run():
    write_monthly_archives(bf.posts)

def write_monthly_archives(posts):
    m = {} # "/archive/%Y/%m" -> [post, post, ... ]
    for post in posts:
        link = post.date.strftime("/archive/%Y/%m")
        try:
            m[link].append(post)
        except KeyError:
            m[link] = [post]
    for link, posts in m.items():
        bf.templates.chronological.write_blog_chron(posts,root=link)
