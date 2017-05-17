'''intel brain-twister on 8 march'''
from os import write
def recursive_print():
        f = open('zagadka.txt', 'a')
        num = 882504235958091178581291885595786461602115
        while True:
                if num > 256:
                        out = chr(num % 256)
                        f.write(out)
                        num = (num // 256)
                else:
                        f.close()
                        break
