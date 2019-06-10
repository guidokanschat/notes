def forward_backward(LR,b):
  (m,n) = LR.shape
  x = np.zeros(n)
  for i in range(0,n):
    x[i] = b[i]
    for j in range(0,i):
      x[i] -= LR[i,j]*x[j]
  for i in range(n-1,-1,-1):
    for j in range(i+1,n):
      x[i] -= LR[i,j]*x[j]
    x[i] /= LR[i,i]
  return x
