def u64ToInt(L):
    # L is suppose to be a list of u64 elements
    return sum([L[i] * (1<<(64*i)) for i in range(len(L))])

def print_le_hex(x, prefix=''):
    # print the integer x in the rust representation
    print(prefix, end = '')
    print('[')
    y = ZZ(x)
    while y>0:
        print('\t{},'.format(hex(y%(1<<64))))
        y >>= 64
    print(']')