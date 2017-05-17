val = int(input())
delimiter = len(bin(val).replace("0b", ''))
for i in range(1, val + 1):
    print(str(i).rjust(delimiter),
          oct(i).replace("0o", '').rjust(delimiter),
          hex(i).replace("0x", '').rjust(delimiter).upper(),
          bin(i).replace("0b", '').rjust(delimiter))
