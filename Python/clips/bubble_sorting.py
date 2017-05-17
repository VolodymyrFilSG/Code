#Сортування бульбашкою

z = int(input("Скільки чисел потрібно посортувати "))
arr = []
for i in range(z):
    arr.append(int(input("Введіть " + str(i + 1) + " значення\n")))

for p in reversed(range(len(arr))):
    for m in range(p):
        if arr[m] > arr[m+1]:
            arr[m], arr[m+1] = arr[m+1], arr[m]

print(arr)
