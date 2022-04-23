# ENDOMORPHISM
β = (x**3-1).roots()[0][0]
def endo(P) :
    return E(P[0]*β, P[1])
λ = ZZ((X**3-1).roots()[1][0])

# test vector
endo_G1 = endo(G1)
assert endo_G1 == λ * G1
# print_le_hex(G1[0], 'g1_x = ')
# print_le_hex(G1[1], 'g1_y = ')
# print_le_hex(endo_G1[0], 'endo_g1_x = ')
# print_le_hex(endo_G1[1], 'endo_g1_y = ')
