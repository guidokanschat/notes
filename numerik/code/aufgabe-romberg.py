import numpy as np

def trapezoidal(n,f):
    sum = .5*(f(0.) + f(1.))
    for k in range (1,n):
        sum += f(1.*k/n)
    return sum/n

def romberg(n0,steps,order,quadrature,f):
    res = np.zeros((steps,steps))
    for i in range(0,steps):
        n = n0 * 1<<i
        res[i,0] = quadrature(n,f)
        for j in range(1,i+1):
            res[i,j] = res[i,j-1] + \
            (res[i,j-1]-res[i-1,j-1])/(2**(order*j)-1.)
    return res

def func(x):
    return np.sin(np.pi*x)

result = romberg(2,4,2,trapezoidal,func)
print(result)
