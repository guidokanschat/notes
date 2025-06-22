

[t,x] = ode45(@funky_system, [0 8*pi], [1,-1]);
plot(t,x, 'LineWidth', 2);

