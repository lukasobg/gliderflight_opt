close all 

% Parameters
m = 100; % kg
S = 14; % m^2
CD0 = 0.034; % zero drag coefficient
K = 0.07; % induced drag coefficient
g = 9.81;
rho = 1.13; % kg/m^3, air density
CL_range = [-1.4, 1.4]; % allowed lift coefficients

alpha = 0; % for lift coefficient, or is it gamma?

% State variables
x = 0; % m
h = 100; 
v = 150; % m/s
gamma = 0;

y = [x;h;v;gamma];

% Control variable CL / CL*alpha?
CL = 0;