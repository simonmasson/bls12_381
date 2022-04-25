def u64ToInt(L):
    # L is suppose to be a list of u64 elements
    return sum([L[i] * (1<<(64*i)) for i in range(len(L))])

def IntTou64(x):
    x = ZZ(x)
    L = []
    while x>0:
        L.append(x%(1<<64))
        x >>=64
    return L

def IntToBEu8(x):
    x=ZZ(x)
    L = []
    while x>0:
        L=[x%(1<<4)]+L
        x>>=8
    return L

def print_le_hex(x, prefix=''):
    # print the integer x in the rust representation
    print(prefix, end = '')
    print('[')
    y = ZZ(x)
    while y>0:
        print('\t{},'.format(hex(y%(1<<64))))
        y >>= 64
    print(']')