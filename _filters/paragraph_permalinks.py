#Give every paragraph an id if it doesn't have one.
#This allows you to reference individual paragraphs by permalink:
# http://yourblog.com/blog/this-is-a-post#p5

import xml.etree.ElementTree as et

def run(content):
    #ElementTree requires a containing element, so just use <xml>
    d = et.fromstring("<xml>%s</xml>"%content)
    p_num = 1
    for p in d.getiterator("p"):
        if p.get("id") is None:
            p.set('id',"p"+str(p_num))
        p_num += 1
    return et.tostring(d)
