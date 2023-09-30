close all
clear

% Parameters
m = 100; % kg
S = 14; % m^2
CD0 = 0.034; % zero drag coefficient
K = 0.07; % induced drag coefficient
g = 9.81;
rho = 1.13; % kg/m^3, air density

%CL_range = [-1.4, 1.4]; % allowed lift coefficients

% State variables

tspan = [0,60];
x0 = 0; % m
h0 = 200;
v0 = 150; % m/s
gamma0 = 0;

y0 = [x0; h0; v0; gamma0];

[t,y] = ode45(@(t,y) state_eqs(t,y,CD0,K,S,rho,m,g), tspan, y0);

%%%%%%%% EXERCISE 3 %%%%%%%%
%%% i)

x0_vals = [0, 1, 2];
h0_vals = [];s
v0_vals = [100, 150, 200];
gamma0_vals = [];

results = [];

for x0 = x0_range
    for h0 = h0_range
        for v0 = v0_range
            for gamma0 = gamma0_range
                % simulation
            end
        end
    end
end

