% global stiffness
% stiffness = 0.1
a=2;

function xdot = f(t,x)
  xdot = [1000*(sin(t)-x(1))];
endfunction

[t,x] = ode45(@f, [0,4*pi], [1]);
plot(t,x);

