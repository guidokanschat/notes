import numpy as np

def householder_compute (x):
  s = np.dot(x,x)
  alpha = -np.sign(x[0])*np.sqrt(s)
  x[0] -= alpha
  x /= np.sqrt(np.dot(x,x))
  return alpha

def householder_apply (u,x):
  n = x.shape
  s = np.dot(u,x)
  for i in range(0,n[0]):
    x[i] -= 2*s*u[i]

x = np.array([3.,4.,5.])
print (x.shape)
u = np.copy(x)
print(x)
a = householder_compute(u)
print(x)
print(u)
print(a)

householder_apply (u,x)
print(x)
