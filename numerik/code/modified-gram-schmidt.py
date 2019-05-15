def modified_gram_schmidt(v):
  (n,m) = v.shape
  for j in range(m):
    r = np.zeros(m)
    for i in range(j-1):
      r = sprod(v[:,j],v[:,i])
      v[:,j] -= r*v[:,i]
    norm = np.sqrt(sprod(v[:,j],v[:,j]))
    v[:,j] /= norm
