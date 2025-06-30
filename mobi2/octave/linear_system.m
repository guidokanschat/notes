function xdot = linear_system(t,x)
 rhs = [.5;.5];
 Lambda = [-1,0;0,0];
 basis = [1,1;1,0];
 binv = inverse(basis);
 A = binv*Lambda*basis;
 xdot = A*x+rhs;
endfunction

