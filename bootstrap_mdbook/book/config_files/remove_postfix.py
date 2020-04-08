#!/usr/bin/env python3

import os
import re


NAME = re.compile("(.*)_1")
EXT  = re.compile("(\..*)")

def get_new_name(name):
    return NAME.search(name).groups()[0]

def get_ext(name):
    return EXT.search(name).groups()[0]

def main():
    #path = "/home/andrey/Geometry/Geometry Book/src/img/problems/problem1/problem/"
    #path = "/home/andrey/Geometry/Geometry Book/src/img/problems/problem1/solution/"
    for name in os.listdir(path):
        #if True or get_ext(name) == "svg":
        try:
            new_name = get_new_name(name) + get_ext(name)
            print(new_name)
            os.rename(path + name, path + new_name )
        except AttributeError:
            pass
main()
