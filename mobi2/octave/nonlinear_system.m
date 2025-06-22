function xdot = nonlinear_system(t,x)
  A = [-.2,1;-1,-.2];
  a = [5;0];
  B = [-.5,0;0,-.3];
  b = [-5;-1];
  c = [0;5];
  xdot = ((A*(x - a))*(dot(x-b,x-b))*(dot(x-c,x-c))
  + (-.5*(x-b))*(dot(x-a,x-a))*(dot(x-c,x-c))
  + (.1*(x-c))*(dot(x-a,x-a))*(dot(x-b,x-b)));
endfunction

