#https://www.hackerrank.com/challenges/re-split
import re

for i in re.split('\.', input()):
    for j in re.split(',', i):
        if j != "":
            print(j)