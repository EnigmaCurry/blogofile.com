#Give every paragraph an id if it doesn't have one.
#This allows you to reference individual paragraphs by permalink:
# http://yourblog.com/blog/this-is-a-post#p5

from pyquery import PyQuery as pq

def run(content):
    #pyquery needs this wrapped in some tag, otherwise it loses the top-most tag
    #when .html() is run, so just wrap in <xml>.
    d = pq("<xml>%s</xml>"%content)
    p_num = 1
    for p in d("p"):
        if not p.attrib.has_key("id"):
            p.set('id',"p"+str(p_num))
        p_num += 1
    return d.html()
