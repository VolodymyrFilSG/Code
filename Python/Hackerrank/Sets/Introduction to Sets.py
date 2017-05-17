a = int(input())
qwe = set([int(i) for i in input().split(' ')])
lenght = len(qwe)
summ = 0
for i in range(lenght):
	summ += qwe.pop()
print(summ / lenght)
