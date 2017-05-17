a, b = input(), input()
counter, x = 0, 0
for i in range(len(a)):
    if i > x or i == 0:
        x = a.find(b, i)
        if x != (-1):
            counter += 1
print(counter)