#Give every paragraph an id if it doesn't have one.
#This allows you to reference individual paragraphs by permalink:
# http://yourblog.com/blog/this-is-a-post#p5

from pyquery import PyQuery as pq

def run(content):
    d = pq(content)
    p_num = 1
    for p in d("span.post_prose p"):
        if not p.attrib.has_key("id"):
            p.set('id',"p"+str(p_num))
        p_num += 1
    return d.html()
