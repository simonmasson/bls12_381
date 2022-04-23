# GLV SCALAR MULTIPLICATION

def glv(n, P):
    psi_P = endo(P)
    k1, k2 = scalar_decomposition(n, matrix)
    return multi_double_and_add(k1,P,k2,psi_P)

glv_n1_G1 = glv(n1, G1)
assert n1*G1 == glv_n1_G1

# quick bench
t1 = cputime()
for i in range(200):
    Q = glv(n1,P)
t1 = cputime(t1)

t2 = cputime()
for i in range(200):
    Q = n1*P
t2 = cputime(t2)
print("{:.0f}% improvment".format((t1-t2)*100/t2))
# print_le_hex(n1, 'n1 = ')
# print_le_hex(G1[0], 'g1_x = ')
# print_le_hex(G1[1], 'g1_y = ')
# print_le_hex(glv_n1_G1[0], 'glv_n1_g1_x = ')
# print_le_hex(glv_n1_G1[1], 'glv_n1_g1_y = ')
