# SCALAR DECOMPOSITION

M = Matrix([[-λ, 1], [r, 0]])
N = M.LLL()
matrix = ~N

def scalar_decomposition(n, matrix):
    # decompose n = n1 + λ * n2 mod r
    β = vector([n,0]) * matrix
    b = vector([int(β[0]), int(β[1])]) * r
    return n-b[0],-b[1]

# test vector
k1, k2 = scalar_decomposition(n1, matrix)
assert (k1 + λ * k2) % r == n1
# print_le_hex(n1, 'n1 = ')
# print_le_hex(λ, 'λ = ')
# print_le_hex(k1, 'k1 = ')
# print_le_hex(k2, 'k2 = ')
