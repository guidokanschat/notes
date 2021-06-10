import math

def newton(x, f, Dfinv, tol):
  r = f(x)
  while (abs(r)>tol):
    d = Dfinv(x,r)
    x -= d
    r = f(x)
  return x

def f(x):
    return x*x-3.

def Dfinv(x,r):
    return .5/x*r

print(newton(1., f, Dfinv, 1.e-8))

