def backward_subst(A,b):
    (m,n) = A.shape
    x = np.zeros(n)
    for i in range(n-1,-1):
      x[i] = b[i]
      for j in range(i+1,n):
        x[i] -= A[i,j]*x[j]
      x[i] /= A[i,i]      
    return x
