#https://www.hackerrank.com/challenges/introduction-to-regex
import re

exp1 = r'\+*[0-9]*\.[0-9]+'
exp2 = r'\-*[0-9]*\.[0-9]+'

a = int(input())
z = [input() for i in range(a)]
for i in z:
    print (True if re.fullmatch(exp1, i) or re.fullmatch(exp2, i) else False)
