#Give every paragraph an id if it doesn't have one.
#This allows you to reference individual paragraphs by permalink:
# http://yourblog.com/blog/this-is-a-post#p5

# PyQuery version. Works great, is forgiving of bad HTML, but requries libxml
# which is not likely installed on the user's machine:

from pyquery import PyQuery as pq

def run(content):
    d = pq("<xml>%s</xml>"%content)
    p_num = 1
    for p in d("p"):
        if not p.attrib.has_key("id"):
            p.set('id',"p"+str(p_num))
        p_num += 1
    return d.html()

# ElementTree version. Is not very forgiving of bad HTML.
# Tidy could help but that would be another install, which if we
# were going to do that, just use the PyQuery version above.

# import xml.etree.ElementTree as et

# def run(content):
#     #ElementTree requires a containing element, so just use <xml>
#     d = et.fromstring("<xml>%s</xml>"%content)
#     p_num = 1
#     for p in d.getiterator("p"):
#         if p.get("id") is None:
#             p.set('id',"p"+str(p_num))
#         p_num += 1
#     return et.tostring(d)
