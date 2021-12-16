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

dimension = n
x = numpy.zeros(n)
b = numpy.zeros(n)
# fill b with right hand side
# A suitable matrix object
tol = np.sqrt(b*b)*1.e-12

steepest_descent(A,b,x,tol)
