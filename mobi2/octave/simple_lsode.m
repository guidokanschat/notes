%
t = linspace(0,10);

x0 = [.01];

x = lsode(@logistic, x0, t);
plot(t,x);

