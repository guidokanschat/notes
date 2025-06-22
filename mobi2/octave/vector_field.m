% === Vector Field Setup ===

% Create grid of prey and predator values
[x, y] = meshgrid(-10:0.5:10, -10:0.5:10);

% Initialize derivative matrices
u = zeros(size(x));
v = zeros(size(y));

% Compute derivatives using the Lotka-Volterra function
for i = 1:numel(x)
  xv = [x(i); y(i)];
  dxdt = nonlinear_system(0,xv);  % t is unused
  u(i) = dxdt(1);
  v(i) = dxdt(2);
end

% Normalize for visual clarity
magnitude = (u.^2 + v.^2).^0.42;

% magnitude(magnitude<1) += .3;
u = u ./ magnitude;
v = v ./ magnitude;

% Plot the vector field
quiver(x, y, u, v, 1.5, 'k');

axis([-10 10 -10 10]);
hold on;

% === Trajectories Setup ===

% Initial conditions
initial_conditions = [-10 5.5; -10 6];%;0 10; 5 10; 10 10; 10 -5];
%colors = ['r', 'g', 'b'];

for i = 1:size(initial_conditions, 1)
  x0 = initial_conditions(i, :)';
  [t,trajectory] = ode45(@nonlinear_system, [0 0.02], x0);
  plot(trajectory(:,1), trajectory(:,2), 'LineWidth', 2);
end

hold off;
axis tight;
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperSize', [10,10]);
set(gcf, 'PaperPositionMode', 'auto');
print("aufgabe-9.pdf","-dpdf");

