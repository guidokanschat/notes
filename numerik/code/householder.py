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

def householder_qr (A):
  (m,n) = A.shape
  D = np.zeros(n)
  for k in range(0,n-1):
    D[k] = householder_compute(A[k:m,k])
    for i in range (k+1,n):
      householder_apply(A[k:m,k],A[k:m,i])
  return D

def householder_solve (QR,D,b)
  (m,n) = QR.shape
  for k in range (0,n-1):
    householder_apply(QR[k:m,k],b[k:m])
  x = np.zeros(n)
  for k in range(n-1,-1,-1):
    x[k] = b[k]
    for j in range(k+1,n):
      x[k] -= A[k,j]*x[j]
    x[k] /= D[k]   
  return x


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

print("QR")
A = np.array([[2.,-1.,0.],[-1.,2.,-1.],[0.,-1.,2.]])
diag = householder_qr(A)
print(A)
print(diag)
