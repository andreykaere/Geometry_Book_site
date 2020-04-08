#!/usr/bin/env python3

from fileoperations import *

import re


CLASS_EXP = re.compile('class="(.*?)"')

ID_EXP = re.compile('id="(.*?)"')


ICONS = set()


def get_title_id(line):
    return ID_EXP.search(line).groups()[0]


def get_icons_id(line, filename):
    global ICONS

    section_id   = get_title_id(line)
    comment_icon = section_id + "_" + filename + "_comment" 
    edit_icon    = section_id + "_" + filename + "_edit" 

    ICONS.add(comment_icon)
    ICONS.add(edit_icon)

    return (comment_icon, edit_icon)



def is_class(line, class_to_check):
    try:
        class_name = CLASS_EXP.search(line).groups()[0]
        return class_name == class_to_check
    
    except AttributeError:
        return False


def change_ref(html, line_number):
    html[line_number] = html[line_number].replace("<a", "<div")
    html[line_number] = html[line_number].replace("</a>", "</div>")


def add_icons(html, line_number, filename):
    #print(html[line_number].split(">"))
    block = html[line_number].split(">")
    
    h_tag = block[2].split("<")

    block[2] = h_tag[0] + '</div><div id="{d[0]}" style="display: none;" class="comment"><svg x="0px" y="0px" viewBox="0 0 490 490" style="enable-background:new 0 0 490 490;" xml:space="preserve"><path d="m383.95 490l-153.24-125.75h-180c-27.924 0-50.631-23.111-50.631-51.528v-261.2c0-28.417 22.707-51.528 50.631-51.528h388.57c27.924 0 50.631 23.111 50.631 51.528v261.2c0 28.417-22.707 51.528-50.631 51.528h-55.34v125.75zm-333.23-459.38c-11.032 0-20.016 9.388-20.016 20.913v261.2c0 11.525 8.984 20.913 20.016 20.913h190.94l111.68 91.635v-91.635h85.954c11.032 0 20.016-9.388 20.016-20.913v-261.2c0-11.525-8.984-20.913-20.016-20.913h-388.57z"/><rect x="75.812" y="89.512" width="338.38" height="30.615"/><rect x="75.812" y="164.57" width="277.15" height="30.615"/><rect x="75.812" y="239.61" width="215.92" height="30.615"/></svg></div><div id="{d[1]}" style="display: none;" class="edit"><svg version="1.1" viewBox="0 0 26 26" xmlns="http://www.w3.org/2000/svg"><path d="m20.094 0.25c-0.59375-0.003906-1.1758 0.20703-1.625 0.65625l-1 1.0312 6.5938 6.625 1-1.0312c0.90234-0.90234 0.91016-2.3672 0-3.2812l-3.3125-3.3125c-0.45703-0.45703-1.0625-0.68359-1.6562-0.6875zm-3.75 2.5938l-1.5625 1.5 6.875 6.875 1.5938-1.4688zm-2.5625 2.5938l-10.812 10.719c-0.25 0.12891-0.42969 0.35547-0.5 0.625l-2.3125 7.8438c-0.10547 0.34375-0.011719 0.72266 0.24219 0.97656 0.25391 0.25391 0.63281 0.34766 0.97656 0.24219l7.8438-2.3125c0.36328-0.054687 0.66406-0.30859 0.78125-0.65625l10.656-10.562-1.4688-1.4688-10.938 10.969-4.4062 1.2812-0.9375-0.9375 1.3438-4.5938 10.844-10.812zm2.375 2.4062l-10.969 11 1.5938 0.34375 0.21875 1.4688 11-10.969z"/></svg></div><' + h_tag[1] 
    block.insert(2, '<div style="display: inline-block; "')
    
    html[line_number] = ">".join(block).format(d = get_icons_id(html[line_number], 
                                                                       filename))


def wrap_icons(path_to_file, filename):
    html = get_lines(path_to_file)

    for line_number, line in enumerate(html):
        if is_class(line, "header"):
            #print(line)

            change_ref(html, line_number)
            
            add_icons(html, line_number, filename)
            #add_comment_icon(html, line_number)
            #add_edit_icon(html, line_number)
    
    update_file(path_to_file, html)


def write_changes_to_script():
    filename  = "js/add_icons.js"
    script    = get_lines(filename)
    statement = "\tlet iconsIds = "
    array = str(list(ICONS)) + ";\n"

    for line_number, line in enumerate(script):
        if statement.strip() in line:
            script[line_number] = statement + array

    update_file(filename, script)



def main():
    path = "../book"
    ignore_list = []#["print.html", "index.html"]
    html_files = get_all_html_files(path)

    for path_to_file, filename in html_files:
        
        if filename in ignore_list: continue

        wrap_icons(path_to_file, get_only_filename(filename))

    write_changes_to_script()

main()
