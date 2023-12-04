import numpy as np
import scipy

def steepest_descent(A,b,x,tol):
  (n) = x.shape
  r = b
  r -= A @ x
  while True:
    r2 = np.dot(r,r)
    if (r2<tol*tol):
      break
    p = A @ r
    alpha = r2/(np.dot(p,r))
    scipy.linalg.blas.daxpy(r,x,n,alpha)
    scipy.linalg.blas.daxpy(p,r,n,-alpha)
