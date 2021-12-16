import numpy as np

def steepest_descent(A,b,x,tol):
  r = b
  r -= A.dot(x)
  while True:
    if (r*r<tol*tol):
      break
    p = A.dot(r)
    alpha = (r*r)/(p*r)
    x += alpha*r
    r -= alpha*p
