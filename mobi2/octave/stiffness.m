% global stiffness
% stiffness = 0.1
a=2;

function xdot = f1(t,x)
  xdot = [10*(sin(t)-x(1))];
endfunction
function xdot = f2(t,x)
  xdot = [100*(sin(t)-x(1))];
endfunction
function xdot = f3(t,x)
  xdot = [1000*(sin(t)-x(1))];
endfunction

[t1,x1] = ode45(@f1, [0,4*pi], [1]);
[t2,x2] = ode45(@f2, [0,4*pi], [1]);
[t3,x3] = ode45(@f3, [0,4*pi], [1]);
plot(t1,x1,t2,x2,t3,x3);
legend('10','100','1000');

axis([0 4*pi -1.1 1.1]);
print("stiff.pdf","-dpdf");

numel(t1)
numel(t2)
numel(t3)


