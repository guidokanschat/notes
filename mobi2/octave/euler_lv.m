% === Vector Field Setup ===
labels = {};

% Create grid of prey and predator values
[prey_vals, predator_vals] = meshgrid(0:1:50, 0:1:30);

% Initialize derivative matrices
u = zeros(size(prey_vals));
v = zeros(size(predator_vals));

% Compute derivatives using the Lotka-Volterra function
for i = 1:numel(prey_vals)
  x = [prey_vals(i); predator_vals(i)];
  dxdt = lotka_volterra(x, 0);  % t is unused
  u(i) = dxdt(1);
  v(i) = dxdt(2);
end

% Normalize for visual clarity
magnitude = sqrt(u.^2 + v.^2);
u = u ./ magnitude;
v = v ./ magnitude;

set(0, 'defaultLineLineWidth', 1);

% Plot the vector field
quiver(prey_vals, predator_vals, u, v, 0.5, 'k');
xlabel('Beute');
ylabel('Räuber');
title('Lotka-Volterra mit Euler-Polygonzug');
axis([0 50 0 30]);
labels{1} = 'Vektorfeld';
hold on;

% === Trajectories Setup ===

function x=euler_trajectory(t,x0)
  x = zeros(numel(t), 2);
  x(1,1) = x0(1);
  x(1,2) = x0(2);
  for i=2:numel(t)
    xdot = lotka_volterra(x(i-1,:),0);
    dx = (t(i)-t(i-1))*xdot;
    xnew = x(i-1,:) + transpose(dx);
    x(i,:) = xnew;
  end
endfunction

stepvalues = [40];


for i=1:numel(stepvalues)
  t = linspace(0, 20, stepvalues(i));
  x = euler_trajectory(t,[15 10]);
  plot(x(:,1),x(:,2), 'LineWidth', 2);
  labels{i+1} = sprintf('Schrittweite %f',20./stepvalues(i));
  filename = sprintf('Euler-LV-%d.pdf',stepvalues(i));
end
legend(labels);
hold off;

set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperSize', [12,16]);
set(gcf, 'PaperPositionMode', 'auto');print(filename,"-dpdf");

