% === Vector Field Setup ===

% Create grid of prey and predator values
[prey_vals, predator_vals] = meshgrid(0:1:30, 0:1:30);

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

% Plot the vector field
quiver(prey_vals, predator_vals, u, v, 0.5, 'k');
xlabel('Prey Population');
ylabel('Predator Population');
title('Lotka-Volterra Phase Portrait with Trajectories');
axis([0 30 0 30]);
hold on;

% === Trajectories Setup ===

% Time vector
t = linspace(0, 50, 500);

% Initial conditions
initial_conditions = [5 10; 10 10; 20 10];
colors = ['r', 'g', 'b'];

for i = 1:size(initial_conditions, 1)
  x0 = initial_conditions(i, :)';
  trajectory = lsode(@lotka_volterra, x0, t);
  plot(trajectory(:,1), trajectory(:,2), [colors(i) '-'], 'LineWidth', 2);
end

legend('Vector Field', '(5,10)', '(10,10)', '(20,10)');
hold off;

pause(10);

