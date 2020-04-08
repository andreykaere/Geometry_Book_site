import re
import os



def get_only_filename(filename):
    return re.findall("^(.*)\.", filename)[0]

def is_html(filename):
    return ".html" in filename
 
def is_extension(filename, ext):
    return re.findall(ext + "$", filename)

def make_file_path(dirpath, filename):
    return dirpath + "/" + filename


def get_ext_files_from_dir(dirpath, filenames, ext):
    dir_files = []

    for filename in filenames:
        if is_extension(filename, ext):
            dir_files += [(make_file_path(dirpath, filename), filename)]
    return dir_files


def get_all_ext_files(path, ext):
    files = []

    for dirpath, dirname, filenames in os.walk(path):
        files += get_ext_files_from_dir(dirpath, filenames, ext)
    return files


def read_file(filename):
    with open(filename) as file:
        return file.read()


def get_lines(file):
    with open(file) as lines:
        return [line for line in lines]


def update_file(filename, content):
    new_file = open(filename, "w")
    for line in content:
        new_file.write(line)

    new_file.close()



get_all_html_files = lambda p: get_all_ext_files(p, "html")
get_all_css_names  = lambda p: [i[1] for i in get_all_ext_files(p, "css")]
get_all_js_names   = lambda p: [i[1] for i in get_all_ext_files(p, "js")]
