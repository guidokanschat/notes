xmin = -2;
xmax = 2;
ymin = -2;
ymax = 2;

xvals = linspace(xmin,xmax,15);
yvals = linspace(ymin,ymax,15);

[x, y] = meshgrid(xvals,yvals);

% Initialize derivative matrices
u = zeros(size(x));
v = zeros(size(y));

% Compute derivatives using the Lotka-Volterra function
for i = 1:numel(x)
  xv = [x(i); y(i)];
  dxdt = linear_system(0,xv);  % t is unused
  u(i) = dxdt(1);
  v(i) = dxdt(2);
end

% Normalize for visual clarity
% magnitude = (u.^2 + v.^2).^0.42;

% magnitude(magnitude<1) += .3;
% u = u ./ magnitude;
% v = v ./ magnitude;

% Plot the vector field
set(0, 'defaultLineLineWidth', 1);

quiver(x, y, u, v, 1.5, 'k');

axis([xmin,xmax,ymin,ymax]);

set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperSize', [10,10]);
set(gcf, 'PaperPositionMode', 'auto');
print("aufgabe-10-nonortho.pdf","-dpdf");

