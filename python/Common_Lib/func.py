from robot.api.deco import keyword
import json


@keyword('addvalues')
def add_nums(num1, num2):
    return int(num1) + int(num2)


@keyword('read file')
def read_json_file(file_name):
    f = open(file_name)
    a = json.load(f)
    return a
