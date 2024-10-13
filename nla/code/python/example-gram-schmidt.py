import numpy as np

def gram_schmidt(v):
  (n,m) = v.shape
  for j in range(n):
    delta = np.zeros(m)
    for i in range(j):
      r = sprod(v[:,j],v[:,i])
      delta += r*v[:,i]
    v[:,j] -= delta
    norm = np.sqrt(sprod(v[:,j],v[:,j]))
    v[:,j] /= norm
def modified_gram_schmidt(v):
  (n,m) = v.shape
  for j in range(m):
    for i in range(j):
      r = sprod(v[:,j],v[:,i])
      v[:,j] -= r*v[:,i]
    norm = np.sqrt(sprod(v[:,j],v[:,j]))
    v[:,j] /= norm


n = 5

#Build Hilbert matrix of size n
hilbert = np.zeros((n,n))
for i in range(n):
  for j in range(n):
    hilbert[i,j] = 1./(i+j+1.)

hilbert
