import operator

from blogofile.cache import bf

def run():
    write_monthly_archives()

def sort_into_archives():
    #This is run in 0.initial.py
    for post in bf.posts:
        link = post.date.strftime("archive/%Y/%m")
        try:
            bf.archived_posts[link].append(post)
        except KeyError:
            bf.archived_posts[link] = [post]
    for archive, posts in sorted(
        bf.archived_posts.items(), key=operator.itemgetter(0), reverse=True):
        name = posts[0].date.strftime("%B %Y")
        bf.archive_links.append((archive, name, len(posts)))
    
def write_monthly_archives():
    for link, posts in bf.archived_posts.items():
        name = posts[0].date.strftime("%B %Y")
        bf.controllers.chronological.write_blog_chron(posts,root=link)
