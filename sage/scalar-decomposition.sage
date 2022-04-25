# SCALAR DECOMPOSITION

M = Matrix([[-λ, 1], [r, 0]])
N = M.LLL()
matrix = ~N

def scalar_decomposition(n):
    # decompose n = n1 + λ * n2 mod r
    beta = vector([n,0]) * matrix
    b = vector([floor(beta[0]), floor(beta[1])]) * N
    return n-b[0], -b[1]
