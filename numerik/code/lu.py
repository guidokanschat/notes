def lu_decomposition(A):
  (m,n) = A.shape
  for k in range (0,n-1):
    piv = 1./ A[k,k]
    for i in range (k+1,n):
      A[i,k] *= piv
      for j in range (k+1,n):
        A[i,j] -= A[k,j]*A[i,k]
