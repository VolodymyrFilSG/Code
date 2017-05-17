lenght = int(input())
a = []

for i in range(lenght):
    a.append([input(), float(input())])

a.sort(key=lambda x: float(x[1]))

finded = False
b = []
for i in range(lenght):
    if not finded:
        if a[i][1] > a[0][1]:
            finded = True
            b.append(a[i][0])
            stored = a[i][1]
    elif a[i][1] == stored:
        b.append(a[i][0])
    else:
        break

b.sort()

for i in range(len(b)):
    print(b[i])