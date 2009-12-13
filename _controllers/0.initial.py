"""Initialize some things before rendering"""

from blogofile.cache import bf

def run():
    # Find all the categories and archives before we write any pages

    bf.archived_posts = {} ## "/archive/Year/Month" -> [post, post, ... ]
    bf.archive_links = []  ## [("/archive/2009/12", name, num_in_archive1), ...] (sorted in reverse by date)
    bf.categorized_posts = {} ## "Category Name" -> [post, post, ... ]
    bf.all_categories = [] ## [("Category 1",num_in_category_1), ...] (sorted alphabetically)
    
    bf.controllers.archives.sort_into_archives()
    bf.controllers.categories.sort_into_categories()
