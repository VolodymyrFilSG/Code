# min and max functions on python. Challenge from checkio 

def min(*args, **kwargs):
    key = kwargs.get("key", None)
    arr = list(args)
    
    if len(arr) == 1:
        arr = list(arr[0])
    ind = 0
    if key:
        mn = key(arr[0])
    else:
        mn = arr[0]
    for i in arr:
        q = i
        if key:
            q = key(i)
        if q < mn:
            mn = i
            ind = arr.index(i)
    return arr[ind]


def max(*args, **kwargs):
    key = kwargs.get("key", None)
    arr = list(args)
    if len(arr) == 1:
        arr = list(arr[0])

    ind = 0
    if key:
        mx = key(arr[0])
    else:
        mx = arr[0]
    for i in arr:
        q = i
        if key:
           q = key(i) 
        if q > mx:
            mx = i
            ind = arr.index(i)
    return arr[ind]
