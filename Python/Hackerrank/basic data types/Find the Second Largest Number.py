lenght = int(input())
a = sorted([int(i) for i in input().split(' ')])
for i in reversed(range(lenght)):
    if a[i] < max(a):
        print(a[i])
        break
