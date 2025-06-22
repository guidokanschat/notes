function xdot = funky_system(t,x)
  A = [cos(t),sin(t);-sin(t),cos(t)];
  xdot = A*x;
endfunction

