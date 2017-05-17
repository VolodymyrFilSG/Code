N = int(input())
K = ((N * 2) - 1)


def makeLine(amount, letter):
    arr = ""
    for j in reversed(range(int(amount / 2) + 1)):
        arr += (chr(letter + j)) + '-'
    for j in range(1, int(amount / 2) + 1):
        arr += (chr(letter + j)) + '-'
    return arr[:-1]


centerLine = makeLine(K, ord('a'))

for i in range(1, K, 2):
    print("-" * int(K - i), makeLine(i, ord(centerLine[i - 1])), "-" * int(K - i), sep = '')

print(centerLine)

for i in range(K - 2, -1, -2):
    print("-" * int(K - i), makeLine(i, ord(centerLine[i - 1])), "-" * int(K - i), sep = '')
