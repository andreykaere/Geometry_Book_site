#!/usr/bin/env python3


from fileoperations import *


import os

MATH_JAX_SCRIPT = """
        <script type="text/x-mathjax-config">
            MathJax.Hub.Config({
                extensions: ["tex2jax.js"],
                jax: ["input/TeX", "output/HTML-CSS"],
                tex2jax: {
                  inlineMath: [ ['$','$'], ["\\\\(", "\\\\)"] ],
                  displayMath: [ ['$$','$$'], ["\\\\[","\\\\]"] ],
                  processEscapes: true
                },
                "HTML-CSS": { fonts: ["TeX"] },
                TeX: {
                    Macros: {
                        xspace: '',
                        ensuremath: '',
                        left: '',
                        right: '',
                    }
                }
            });
        </script>""" + "\n\n\t\t"

MATH_JAX_LOAD = """<script async type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>"""


JQUERY = """\n\n\n\t\t<!-- jQuery -->\n\n\t\t<script defer src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>\n\n\n\t\t<!--Custom JS scripts-->\n\n\t\t"""

SCRIPT_IMPORT_STATEMENT = '<script defer type="text/javascript" src="{}" charset="utf-8"></script>\n\t\t'

SCRIPT_LABEL = "<!-- Custom JS scripts -->"

SCRIPT_DIR = "config_files/js"


def make_first(array, value):
    value_index = array.index(value)
    array.pop(value_index)
    array.insert(0, value)
    
    return array


def order_scripts(scripts_names):
    scripts_names = make_first(scripts_names, "change_elements_theme.js")
    return scripts_names
    

SCRIPTS_NAMES = get_all_js_names("js") #subdirectory js/
SCRIPTS_NAMES = order_scripts(SCRIPTS_NAMES)
#["allow_hidden.js", "change_figures.js", "add_icons.js"]



def get_mathjax_load_line(html):
    return html.find(MATH_JAX_LOAD)


def generate_script_path(filename, script_name):
    depth = filename.count(r"/") - 2
    return r"../" * depth + SCRIPT_DIR + "/" + script_name


def generate_script_import(filename, script_name):
    return SCRIPT_IMPORT_STATEMENT.format(generate_script_path(filename, 
                                                               script_name))

def get_import_script_line(html):
    return html.find(MATH_JAX_LOAD) + len(MATH_JAX_LOAD)
    #return html.find(SCRIPT_LABEL) + len(SCRIPT_LABEL)

def insert_script(filename, html, place, script):
    new_html = html[:place] + script + html[place:]
    update_file(filename, new_html)



def implement_script(filename, script, get_place):
    html = read_file(filename)
    script_place = get_place(html)

    if script_place: insert_script(filename, 
                                   html, 
                                   script_place, 
                                   script)



def import_all_scripts(path_to_file):
    
    implement_script(path_to_file, 
                     MATH_JAX_SCRIPT, 
                     get_mathjax_load_line)

    

    for script_name in SCRIPTS_NAMES:
        import_statement = generate_script_import(path_to_file, 
                                                  script_name)

        implement_script(path_to_file,
                         import_statement,
                         get_import_script_line)


    implement_script(path_to_file, 
                     JQUERY, 
                     get_import_script_line)

def main():
    path = "../book"
    html_files = get_all_html_files(path)

    for path_to_file, filename in html_files:
        import_all_scripts(path_to_file)


main()



