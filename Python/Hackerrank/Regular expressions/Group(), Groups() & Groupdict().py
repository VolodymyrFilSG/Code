#https://www.hackerrank.com/challenges/re-group-groups
import re

a = input()
stored = ''
for i in a:
    if re.match(r'[0-9a-zA-Z]', i):
        if stored == i:
            print(i)
            match = True
            break
        else:
            stored = i
    match = False
if not match:
    print('-1')
