######################################################################
# This is the main Blogofile configuration file.
# www.Blogofile.com
#
# This file has the following ordered sections:
#  * Basic Settings
#  * Intermediate Settings
#  * Advanced Settings
#
#  You really only _need_ to change the Basic Settings.
######################################################################

######################################################################
# Basic Settings
#  (almost all sites will want to configure these settings)
######################################################################
#Your Blog's name. This is used repeatedly in default blog templates
blog_name        = "Blogofile"
#Your Blog's full URL
blog_url         = "http://www.blogofile.com"
#A short one line description of the blog, used in the RSS/Atom feeds.
blog_description = "A static blog engine/compiler"
#The timezone that you normally write your blog posts from
blog_timezone    = "US/Eastern"

######################################################################
# Intermediate Settings
######################################################################
#### Disqus.com comment integration ####
disqus_enabled = True
disqus_name    = "blogofile"

#### Blog post syntax highlighting ####
syntax_highlight_enabled = True
# You can change the style to any builtin Pygments style
# or, make your own: http://pygments.org/docs/styles
syntax_highlight_style   = "murphy"

######################################################################
# Advanced Settings
######################################################################
# These are the default ignore patterns for excluding files and dirs
# from the _site directory
# These can be strings or compiled patterns.
# Strings are assumed to be case insensitive.
ignore_patterns = [
    r".*[\/]_.*",   #All files that start with an underscore
    r".*[\/]#.*",   #Emacs temporary files
    r".*~$]",       #Emacs temporary files
    r".*[\/]\.git", #Git VCS dir
    r".*[\/]\.hg",  #Mercurial VCS dir
    r".*[\/]\.bzr", #Bazaar VCS dir
    r".*[\/]\.svn", #Subversion VCS dir
    r".*[\/]CVS"    #CVS dir
    ]

### Pre/Post build hooks:
def pre_build():
    #Do whatever you want before the _site is built
    pass
def post_build():
    #Do whatever you want after the _site is built
    pass
