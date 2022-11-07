def newton(x, f, Dfinv, steps):
  for k in range(1,steps):
    r = f(x)
    d = Dfinv(r)
    x -= d
  return x

