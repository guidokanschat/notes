function dxdt = lotka_volterra(x, t)
  % Parameters (adjust as needed)
  alpha = 1.0;   % Prey birth rate
  beta  = 0.1;   % Predation rate
  gamma = 1.5;   % Predator death rate
  delta = 0.075; % Predator reproduction rate per prey eaten

  prey = x(1);
  predator = x(2);

  dxdt = zeros(2,1);
  dxdt(1) = alpha * prey - beta * prey * predator;
  dxdt(2) = delta * prey * predator - gamma * predator;
end
