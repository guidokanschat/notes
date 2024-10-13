import numpy as np

def bmatrix(a):
    """Returns a LaTeX bmatrix

    :a: numpy array
    :returns: LaTeX bmatrix as a string
    """
    if len(a.shape) > 2:
        raise ValueError('bmatrix can at most display two dimensions')
    lines = str(a).replace('[', '').replace(']', '').splitlines()
    rv = [r'\begin{bmatrix}']
    rv += ['  ' + ' & '.join(l.split()) + r'\\' for l in lines]
    rv +=  [r'\end{bmatrix}']
    return '\n'.join(rv)
  
def sprod(u,v):
  return np.dot(u,v)

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


n = 12

#Build Hilbert matrix of size n
hilbert = np.zeros((n,n))
for i in range(n):
  for j in range(n):
    hilbert[i,j] = 1./(i+j+1.)
# hilbert

hilbert2 = hilbert.copy()

gram_schmidt(hilbert)
modified_gram_schmidt(hilbert2)

np.set_printoptions(precision=1)
#np.set_printoptions(suppress=True)

gramian = np.zeros((n,n))
for i in range(n):
  for j in range(n):
    gramian[i,j] = sprod(hilbert[:,j],hilbert[:,i])

print(bmatrix(gramian))
for i in range(n):
  for j in range(n):
    gramian[i,j] = sprod(hilbert2[:,j],hilbert2[:,i])

print (bmatrix(gramian))
