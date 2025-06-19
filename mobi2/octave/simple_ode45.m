%
x0 = [.01];
[t,x] = ode45(@logistic_ode45, [0,10], x0);
plot(t,x);

