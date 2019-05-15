sum = np.float16(1.0)
i = 1.
old = np.float16(0.0)
while (sum != old):
    old = sum
    i += 1.
    diff = np.float16(1./i)
    sum += diff
print (sum)
