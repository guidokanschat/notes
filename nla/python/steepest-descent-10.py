import numpy as np

def steepest_descent(A,b,x,tol):
  r = b
  r -= A @ x
  while True:
    print ("  (",x[0], ",", x[1], ")")
    r2 = np.dot(r,r)
    if (r2<tol*tol):
      break
    p = A @ r
    alpha = (r2)/(np.dot(p,r))
    x += alpha*r
    r -= alpha*p


A = np.eye(2)
A[0,0] = .1
b = np.zeros(2)

x = np.zeros(2)
x[0] = -10.
x[1] = 1.

steepest_descent(A,b,x,1.e-3)

