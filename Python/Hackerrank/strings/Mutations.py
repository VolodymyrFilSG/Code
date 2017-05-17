a = input()
mut = input().split(' ')
print(a[:int(mut[0])], a[int(mut[0]) + 1:], sep = mut[1])