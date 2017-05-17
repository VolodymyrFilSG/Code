#x, y, z, n = int(input()), int(input()), int(input()), int(input())

#print([[q, w, e] for q in range(x + 1) for w in range(y + 1) for e in range(z + 1) if (q + w + e) != n])


for i in range(5):
    print([i])

print(list((i for i in range(5))))
