a, c = 0, 0
b = 1
f = open('fibonacci.txt', 'a')

for i in range(1000000):
        'print(a)'
        a = b + c
        c = b
        b = a

f.write(str(a))
f.write("\n")
f.close()
