# DOUBLE AND ADD ALGORITHM

def double_and_add(n, P):
    if n < 0:
        n = -n
        P = -P
    res = E(0)
    for b in n.bits()[::-1]: 
        res = 2*res
        if b == 1:
            res += P
    return res
