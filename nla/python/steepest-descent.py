import numpy as np

def steepest_descent(A,b,x,tol):
  r = b
  r -= A @ x
  while True:
    r2 = np.dot(r,r)
    if (r2<tol*tol):
      break
    p = A @ r
    alpha = (r2)/(np.dot(p,r))
    x += alpha*r
    r -= alpha*p
