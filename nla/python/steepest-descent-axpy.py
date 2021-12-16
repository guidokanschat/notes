import numpy as np
import scipy

def steepest_descent(A,b,x,tol):
  (n) = x.shape
  r = b
  r -= A.dot(x)
  while True:
    r2 = r*r
    if (r2<tol*tol):
      break
    p = A.dot(r)
    alpha = r2/(p*r)
    scipy.linalg.blas.daxpy(r,x,n,alpha)
    scipy.linalg.blas.daxpy(p,r,n,-alpha)
