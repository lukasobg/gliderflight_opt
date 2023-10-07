rho = 1.13; S = 14; m = 100; g = 9.81; CD0 = 0.034; K = 0.07;

% x = [CL, v, gamma]

obj_fun = @(x) (CD0 + K * x(1)^2) / x(1);

eq_constraints = @(x) [
    -((CD0 + K * x(1)^2) * S * rho * x(2)^2) / (2*m) + g * x(3);  % dv/dt = 0
    0.5 * x(1) * S * rho * x(2)^2 - m*g                           % dg/dt = 0
];

% initial guess
x0 = [1, 20, 0.01];

% bounds
lb = [-1.4, 0, -Inf];
ub = [1.4, Inf, Inf];

options = optimoptions('fmincon');
[x_opt, fval] = fmincon(obj_fun, x0, [], [], [], [], lb, ub, @(x) deal([], eq_constraints(x)), options);

fprintf('Optimal CL: %.3f\n', x_opt(1));
fprintf('Optimal velocity: %.3f\n', x_opt(2));
fprintf('Optimal gamma: %.3f\n', x_opt(3));
fprintf('\nObjective function value: %.3f\n', fval);