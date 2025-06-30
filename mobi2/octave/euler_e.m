t = linspace(0,1,8);

function x=euler(t,x0)
  x = zeros(size(t));
  x(1) = x0;
  for i=2:numel(t)
    xdot = x(i-1);
    dx = (t(i)-t(i-1))*xdot;
    x(i) = x(i-1)+dx;
  end
endfunction

x = euler(t,1);
x(numel(x))


