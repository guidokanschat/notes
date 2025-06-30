function xdot = lorenz(t,x)
  b = 8/3;
  r = 28;
  s = 10;

  x1 = x(1);
  x2 = x(2);
  x3 = x(3);

  xdot = [s*(x2-x1);r*x1-x2-x1*x3;x1*x2-b*x3];
endfunction

