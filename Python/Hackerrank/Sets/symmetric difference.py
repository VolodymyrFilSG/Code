m = int(input())
set1 = set(map(int, input().split(' ')))
n = int(input())
set2 = set(map(int, input().split(' ')))
diff = set1.difference(set2).union(set2.difference(set1))

lenght = len(diff)
arr = []
for i in range(lenght):
	arr.append(diff.pop())
arr.sort()
for i in range(lenght):
	print(arr[i])