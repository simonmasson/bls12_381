load("utils.sage")
load("setting.sage")
load("scalar-decomposition.sage")
load("endo.sage")

f = open('vectors.rs', 'w')
f.write('// file generated automatically\n')

def write_point(f, P, name='p'):
    f.write('let ')
    f.write(name)
    if P.is_zero():
        f.write(' = G1Affine::identity();\n')
        return true
    l_x = IntTou64(P[0]*power_of_two)
    l_y = IntTou64(P[1]*power_of_two)

    f.write(' = G1Affine {\n\tx: Fp::from_raw_unchecked([\n\t\t')
    for word in l_x:
        f.write(str(hex(word)))
        f.write(',')
    f.write('\n\t]),\n')
    f.write('\ty: Fp::from_raw_unchecked([\n\t\t')
    for word in l_y:
        f.write(str(hex(word)))
        f.write(',')
    f.write('\n\t]),\n\tinfinity: Choice::from(0)\n};\n')
    return true

def write_scalar(f, x, name='x'):
    f.write('let ')
    f.write(name)
    if x<0 :
        x = -x
        f.write(' = -')
    else :
        f.write(' = ')
    l_x = IntTou64(x)
    while len(l_x) < 4:
        l_x.append(0)
    f.write('Scalar::from_raw([\n\t')
    for word in l_x:
        f.write(str(hex(word)))
        f.write(',')
    f.write('\n\t]);\n')

# n, n1, n2
# check that n = n1 + λ n2 [r]
n = ZZ(Fr.random_element())
n1, n2 = scalar_decomposition(n)
f.write('#[test]\nfn test_scalar_decomposition() {\n')
write_scalar(f, λ, name='lambda')
write_scalar(f, n, name='n')
write_scalar(f, n1, name='n1')
write_scalar(f, n2, name='n2')
f.write('assert_eq!(n, n1+lambda*n2);\n')
f.write('}\n\n')

# endomorphism check
P = 12*G1
f.write('#[test]\nfn test_psi() {\n')
write_point(f, P, name='p')
write_scalar(f, λ, name='lambda')
psi_P = endo(P)
write_point(f, psi_P, name='psi_p')
f.write('assert_eq!(psi_p, p.mul(lambda).into());\n')
f.write('}\n\n')


# P, glv(n,P)
f.write('#[test]\nfn test_scalar_mul() {\n')
write_point(f, P, name='p')
write_scalar(f, n, name='n')
write_point(f, n*P, name='n_p')
f.write('assert_eq!(n_p, p.mul(n).into());\n')
f.write('}\n')

f.close()
