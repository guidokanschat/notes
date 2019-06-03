def forward_subst(A,b):
    (m,n) = A.shape
    x = np.zeros(n)
    for i in range(0,n):
      x[i] = b[i]
      for j in range(0,i):
        x[i] -= A[i,j]*x[j]
      x[i] /= A[i,i]
    return x
