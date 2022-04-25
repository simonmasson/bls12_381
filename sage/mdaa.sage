# MULTI DOUBLE AND ADD
def multi_double_and_add(n1,P1, n2, P2):
    if n1 < 0 :
        n1 = -n1
        P1 = -P1
    if n2 < 0 :
        n2 = -n2
        P2 = -P2
    if n1 < n2:
        (n1,n2) = (n2,n1)
        (P1,P2) = (P2,P1)
    assert n1 >= n2
    bits_n1 = n1.bits()[::-1]
    bits_n2 = n2.bits()[::-1]
    while len(bits_n2) != len(bits_n1):
        bits_n2 = [0] + bits_n2
    assert len(bits_n2) == len(bits_n1)
    
    res = E(0)
    for i in range(len(bits_n1)):
        res = 2 * res
        if bits_n1[i] == 1 and bits_n2[i] == 1:
            res += P1+P2
        if bits_n1[i] == 1 and bits_n2[i] == 0:
            res += P1
        if bits_n1[i] == 0 and bits_n2[i] == 1:
            res += P2
    return res

# test vectors
n1_G1_n2_P = n1*G1 + n2*P
assert n1_G1_n2_P  == multi_double_and_add(n1,G1,n2,P)
