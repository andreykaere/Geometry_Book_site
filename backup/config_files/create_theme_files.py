#!/usr/bin/env python3

import os
import re


THEMES = {'light': 'pen penColor = rgb("333333");\n',
          'rust':  'pen penColor = rgb("262625");\n', 
          'coal':  'pen penColor = rgb("98a3ad");\n', 
          'ayu':   'pen penColor = rgb("c5c5c5");\n', 
          'navy':  'pen penColor = rgb("bcbdd0");\n', 
         }


NAME_EXP  = re.compile("(.*)_")
THEME_EXP = re.compile(".*_(.*)\.") 
EXT   = re.compile("(\..*)")

def get_name(file):
    return NAME_EXP.search(file).groups()[0]

def get_theme(file):
    return THEME_EXP.search(file).groups()[0]
    

def get_ext(name):
    return EXT.search(name).groups()[0]


def create_file(theme, ext, init_name, file):
    new_file = open(init_name + "_" + theme + ext, "w")
    for line in file:
        new_file.write(line)

    new_file.close()


def get_lines(filename):
    with open(filename) as lines:
        return [line for line in lines]


def change_pen(theme, file):
    for line_number, line in enumerate(file):
        if "pen penColor" in line:
            file[line_number] = THEMES[theme]
            return

def change_pen_color(filename):
    init_name = get_name(filename)
    ext = get_ext(filename)
    
    file = get_lines(filename)


    for theme in THEMES:
        change_pen(theme, file)
        create_file(theme, ext, init_name, file)



def main():
    path = "/home/andrey/Geometry/Geometry Book/src/img/facts/fact7/solution/"
    #path = "/home/andrey/Geometry/Geometry Book/src/img/facts/fact7/problem/"
    for name in os.listdir(path):
        try:
            if get_ext(name) == ".asy":
                change_pen_color(path + name)
    
        except AttributeError:
            pass

main()

