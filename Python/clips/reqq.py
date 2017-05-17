'''Recursive Tree command'''
import os
import sys
from stat import *
def req(path, indent = 0):
    os.chdir(path)
    for x in os.listdir():
        print("  " * indent, end = "")
        if S_ISDIR(os.stat(x).st_mode):
            print(x)
            req(x, indent + 1)
            os.chdir("..")
        else:
            print(x)

def req_fold(Output_file_name, path):
    stdout = sys.stdout
    sys.stdout = open(Output_file_name, "w")
    req(path)
    sys.stdout.flush()
    sys.stdout = stdout
