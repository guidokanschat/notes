def heron(x,steps):
  for k in range(1,steps):
    x = .5*(x+a/x)
  return x
