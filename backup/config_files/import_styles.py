#!/usr/bin/env python3

from fileoperations import *




STYLES_DIR = "config_files/css"

STYLES_NAMES = get_all_css_names("css")


def generate_style_import(path_to_file, style_name):
    pass

def import_all_styles(path_to_file):
    for style_name in STYLES_NAMES:
        
        return

        import_statement = generate_style_import(path_to_file, 
                                                  style_name)

        import_style(path_to_file,
                     import_statement,
                     get_import_script_line)





def main():
    path = "../book"
    html_files = get_all_html_files(path)

    for path_to_file, filename in html_files:
        import_all_styles(path_to_file)

main()
