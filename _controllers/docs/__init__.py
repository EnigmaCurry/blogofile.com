import sys
import os
import os.path
import shlex
import subprocess
import logging
from blogofile.cache import bf

config = {"name"        : "Blogofile Documentation Builder",
          "description" : "Generates project documentation files from Sphinx "
                          "source files",
          "priority"    : 10.0
         }

logger = logging.getLogger(config['name'])

def build_sphinx_build():
    #Abort if sphinx isn't installed
    try:
        import sphinx
    except ImportError:
        return
    #print "Building the docs..."
    #Configure the theme
    #Insert the rendered head, headers, and footers into the theme
    config = sys.modules[globals()['__name__']]
    from mako.template import Template
    head_t = Template(open(os.path.join("_templates","head.mako")).read())
    head = head_t.render(**{'bf':bf})
    header_t = Template(open(os.path.join("_templates","header.mako")).read())
    header = header_t.render(**{'bf':bf})
    footer_t = Template(open(os.path.join("_templates","footer.mako")).read())
    footer = footer_t.render(**{'bf':bf})

    #Create the new layout.html from preparse_layout.html
    #Insert the rendered templates appropriately
    layout = open(os.path.join("_documentation","themes","blogofile",
                               "preparse_layout.html")).read()
    layout = layout.replace("blogofile_head_goes_here",head)
    layout = layout.replace("blogofile_header_goes_here",header)
    layout = layout.replace("blogofile_footer_goes_here",footer)
    layout_f = open(os.path.join("_documentation","themes","blogofile",
                               "layout.html"),"w")
    layout_f.write(layout)
    layout_f.close()
    logger.info("Compiling HTML Documentation..")
    sphinx.main(shlex.split("sphinx-build -q -b html _documentation "+
                            os.path.join("_site","documentation")))


def build_sphinx_pdf():
    #Do PDF generation if TeX is installed
    if os.path.isfile("/usr/bin/tex"):
        latex_dir = tempfile.mkdtemp()
        logger.info("Compiling PDF Documentation..")
        sphinx.main(shlex.split("sphinx-build -q -b latex _documentation "+
                                latex_dir))
        subprocess.Popen(shlex.split(
                "make -C %s all-pdf" % latex_dir),
                         stdout=subprocess.PIPE,
                         stderr=subprocess.PIPE).communicate()
        shutil.copyfile(os.path.join(latex_dir,"Blogofile.pdf"),
                        os.path.join("_site","documentation","Blogofile.pdf"))

def build_graphviz_files():
    if os.path.isfile("/usr/bin/dot"):
        logger.info("Rendering graphviz dot files...")
        in_dir = os.path.join("_documentation","graphs")
        out_dir = os.path.join("_site","documentation","graphs")
        os.mkdir(out_dir)
        for dot_file in os.listdir(in_dir):
            in_path = os.path.join(in_dir,dot_file)
            out_path = os.path.join(out_dir,dot_file)
            png, stderr = subprocess.Popen(shlex.split(
                    "dot -Gsize=\"7,100\" -Tpng {in_path}".format(**locals())),
                                   stdout=subprocess.PIPE).communicate()
            f = open(out_path+".png","w")
            f.write(png)
            f.close()            
            svg, stderr = subprocess.Popen(shlex.split(
                    "dot -Tsvg {in_path}".format(**locals())),
                                   stdout=subprocess.PIPE).communicate()
            f = open(out_path+".svg","w")
            f.write(svg)
            f.close()

def build_no_documentation():
    #In case sphinx isn't installed, we want a nice default page showing why docs
    #weren't built. 
    bf.writer.materialize_template("no_documentation.mako", bf.util.path_join("documentation","index.html"))
    
def run():
    """Build the Blogofile sphinx based documentation"""
    build_no_documentation()
    build_sphinx_build()
    #build_sphinx_pdf()
    build_graphviz_files()
