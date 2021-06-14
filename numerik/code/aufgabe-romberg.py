import numpy as np
import math

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

initial = 2
steps = 5
exact = 2./np.pi

result = romberg(initial,steps,2,trapezoidal,func)
print(result)

logerror = np.zeros((steps,steps))

print("Fehler")
for k in range (0,steps):
    print ("Spalte ", k)
    for i in range (k,steps):
        e = abs(exact-result[i,k])
        print ("Zeile ", i, " Fehler ", e, "\tLog ", math.log2(e))
        logerror[i,k] = math.log2(e)

print("Experimentelle Ordnungen")
for k in range (0,steps):
    print ("Spalte ", k)
    for i in range (k+1,steps):
        p = logerror[i-1,k]-logerror[i,k]
        print (p)
        
diff = np.zeros((steps,steps))

print("Intrinsische Ordnungen")
for k in range (0,steps):
    print ("Spalte ", k)
    for i in range (k+1,steps):
        diff[i,k] = result[i,k] - result[i-1,k]
        
