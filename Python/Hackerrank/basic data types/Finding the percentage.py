lenght = int(input())
a = []

for i in range(lenght):
    a.append(input().split(' '))

name = input()

for i in range(lenght):
    if a[i][0] == name:
        print('%.2f' % ((float(a[i][1]) + float(a[i][2]) + float(a[i][3])) / 3))
