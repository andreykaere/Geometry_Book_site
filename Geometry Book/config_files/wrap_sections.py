#!/usr/bin/env python3

from fileoperations import *
import os
import re

CLASS_EXP = re.compile('class="(.*?)"')
ID_EXP = re.compile('id="(.*?)"')

HIDDEN_TITLES = {"Рисунок", 
                 "Доказательство", 
                 "Решение", 
                 "Подсказка", 
                 "Доказательства-свойств", }

ALL_H_TAGS = {("h"+str(i)):0 for i in range(1, 7)}


DIVS = set()
OPEN_DIV_COUNT = 0




def is_class(line, class_to_check):
    try:
        class_name = CLASS_EXP.search(line).groups()[0]
        return class_name == class_to_check
    
    except AttributeError:
        return False


def get_title_id(line):
    return ID_EXP.search(line).groups()[0]


def generate_onclick_arg(line, filename):
    section_id = get_title_id(line)
    return section_id + "_" + filename + "_div-hidden"


def add_hidden_class(html, line_number):
    #arr = line.split(">")
    #arr[0] += ' class="hidden"'

    html[line_number] = html[line_number].replace('class="header"',
                                                  'class="header hidden_header"')
    
    #html[line_number] = ">".join(arr)
    
    #update_file(filename, html)


def add_event_listener(html, line_number, filename):
    arr = html[line_number].split(">")
    
    #add event listener to <h> tag
    arr[2] += " onclick='sectionToggle(\"{}\", window.localStorage);'" \
            .format(generate_onclick_arg(html[line_number], filename))
    
    return ">".join(arr)


def generate_div_tag_id(line, filename):
    section_id = get_title_id(line)
    return section_id + "_" + filename + "_div-hidden"


def generate_div_tag(line, filename, hidden):
    global DIVS
    
    div_id  = generate_div_tag_id(line, filename)
    display = ""

    if hidden: 
        DIVS.add(div_id)
        display = "display: none;"
    
    return "<div id=\"{}\" style=\"{}\">\n".format(div_id, display)


def get_h_tag(line):
    return line.split(">")[1][1:]


def get_h_tag_size(line):
    tag = get_h_tag(line)
    return int(tag[1])


def open_div(html, line, line_number, div_tag):
    global OPEN_DIV_COUNT
    
    OPEN_DIV_COUNT += 1
       
    h = get_h_tag(line)

    #print(ALL_H_TAGS)
    ALL_H_TAGS[h] += 1
    #print(ALL_H_TAGS)
    #print()

    html.insert(line_number+1, div_tag)


def close_div(html, line_number):
    global OPEN_DIV_COUNT
    OPEN_DIV_COUNT -= 1
   
    html.insert(line_number, "</div>\n")
    return line_number+1 #because we add </div> in a line_number line




def wrap_img(html, line_number):
    
    #html[line_number] = html[line_number].replace("<p>", 
    #                                              "<div><p>"
    html.insert(line_number,   "<div class=\"image\">\n")
    html.insert(line_number+2, "</div>\n")

    return line_number + 2


def wrap_text(html, line_number):
    html[line_number] = html[line_number].replace("<p>", 
                                           "<div class=\"text\"><p>")
    html[line_number] = html[line_number].replace("</p>", "</p></div>")



def is_hidden_section(line):
    return is_class(line, "header") and get_title_id(line) in HIDDEN_TITLES
   

def wrap_content(html, line, line_number, filename):
    curr_size = get_h_tag_size(line)
    
    for h in ALL_H_TAGS:
        prev_size = int(h[1])

        if ALL_H_TAGS[h] and curr_size <= prev_size:
            line_number = close_div(html, line_number)
            ALL_H_TAGS[h] -= 1

    hidden = False
    
    if is_hidden_section(line):
        add_hidden_class(html, line_number)
        html[line_number] = add_event_listener(html, line_number, filename)
        
        hidden = True
    
    div_tag = generate_div_tag(line, filename, hidden)

    open_div(html, line, line_number, div_tag)

    return line_number


def is_end(line):
    return line.strip() == "</main>"


def need_to_close():
    return OPEN_DIV_COUNT


def add_div(html, line, line_number, filename):
    global OPEN_DIV_COUNT, ALL_H_TAGS 
    
    if is_end(line):
        if need_to_close():
            while OPEN_DIV_COUNT:
                line_number = close_div(html, line_number)
            
        
        ALL_H_TAGS = {("h"+str(i)):0 for i in range(1, 7)}

        return line_number
    
    line_number = wrap_content(html, 
                               line, 
                               line_number, 
                               filename) # save changes from function
        
    
    return line_number




def wrap_sections(path_to_file, filename):
    #print(path_to_file, filename)
    html = get_lines(path_to_file)
    line_number = 0
    
    while line_number < len(html):
        line = html[line_number]
        
        if is_end(line) or is_class(line, "header"): #is_hidden_section(line):
            line_number = add_div(html, 
                                  line, 
                                  line_number, 
                                  filename)
        
        if is_class(line, "figure"):
            line_number = wrap_img(html, line_number)
        

        if not is_class(line, "figure"):
            wrap_text(html, line_number)

        line_number += 1

    update_file(path_to_file, html)


def write_changes_to_script():
    filename  = "js/allow_hidden.js"
    script    = get_lines(filename)
    statement = "\tlet elementsNames = "
    array = str(list(DIVS)) + ";\n"

    for line_number, line in enumerate(script):
        if statement.strip() in line:
            script[line_number] = statement + array

    update_file(filename, script)


def main():
    path = "../book"
    html_files = get_all_html_files(path)

    for path_to_file, filename in html_files:
        wrap_sections(path_to_file, get_only_filename(filename))

    write_changes_to_script()
    
    #print(DIVS)

main()

