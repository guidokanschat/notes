def modified_gram_schmidt(v):
  (n,m) = v.shape
  for j in range(m):
    for i in range(j):
      r = sprod(v[:,j],v[:,i])
      v[:,j] -= r*v[:,i]
    norm = np.sqrt(sprod(v[:,j],v[:,j]))
    v[:,j] /= norm
