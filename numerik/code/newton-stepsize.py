import math

def newton(x, f, Dfinv, tol):
  r = f(x)
  r_current = abs(r)
  while (r_current>tol):
    d = Dfinv(x,r)
    x -= d
    r_old = r_current
    r = f(x)
    r_current = abs(r)
    while (r_current>=r_old):
      d *= 0.5
      x += d
      r = f(x)
      r_current = abs(r)
  return x

def f(x):
    return x*x-3.

def Dfinv(x,r):
    return .5/x*r

print(newton(1., f, Dfinv, 1.e-8))

