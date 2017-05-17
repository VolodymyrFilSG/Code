n, m = input().split(' ')
n, m = int(n), int(m)

a = []

for i in range(n):
	a.append(input().split(' '))

k = int(input())

a.sort(key=lambda x: int(x[k]))

for i in range(n):
    for j in range(m):
        print(int(a[i][j]), end=' ')
    print()
