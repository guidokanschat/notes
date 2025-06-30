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
title('Lotka-Volterra mit Dormand/Prince 45');
axis([0 50 0 30]);
labels{1} = 'Vektorfeld';
hold on;

% === Trajectories Setup ===

function xdot = lvode45(t,x)
  xdot = lotka_volterra(x,t);
endfunction

[t,x] = ode45(@lvode45, [0,20], [15,10]);
plot(x(:,1),x(:,2), 'LineWidth', 2);
labels{2} = sprintf('Mittlere Schrittweite %f',20./numel(t));
filename = sprintf('DP45-LV.pdf');
legend(labels);
% hold off;

set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperSize', [12,16]);
set(gcf, 'PaperPositionMode', 'auto');
print(filename,"-dpdf");

axis([13 30 6 15]);
print("DP45-LV-zoom","-dpdf");
