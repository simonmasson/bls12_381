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

# test vectors
n1 = 42064177823902585819440855152921881988240818154508136419258332325648002561295
n1_G1 = n1*G1
assert n1_G1 == double_and_add(n1, G1)
# another scalar, another point
n2 = 42064177823902585819440855152921881988240818154508136419258332325648002561295
P = E([
    503747127649821961350815625702844914287364766963976956246207035377136420637830146725336314674263987798846048131084,
    1268127705429209540444524304145660776459837068341647103380143441139672617402329079635895669349795206092834728217841,
])
n2_P = n2*P
assert n2_P == double_and_add(n2, P)
# print_le_hex(n1, 'n1 = ')
# print_le_hex(G1[0], 'g1_x = ')
# print_le_hex(G1[1], 'g1_y = ')
# print_le_hex(n1_G1[0], 'n1_g1_x = ')
# print_le_hex(n1_G1[1], 'n1_g1_y = ')
# print_le_hex(n2, 'n2 = ')
# print_le_hex(P[0], 'p_x = ')
# print_le_hex(P[1], 'p_y = ')
# print_le_hex(n2_P[0], 'n2_p_x = ')
# print_le_hex(n2_P[1], 'n2_p_y = ')
