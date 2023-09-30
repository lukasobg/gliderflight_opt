close all
clear

% Parameters
m = 100; % kg
S = 14; % m^2
CD0 = 0.034; % zero drag coefficient
K = 0.07; % induced drag coefficient
g = 9.81;
rho = 1.13; % kg/m^3, air density

% State variables
tspan = [0,200];
x0 = 0; % m
h0 = 500;
v0 = 100; % m/s
gamma0 = -pi/4; %pi/4;

y0 = [x0; h0; v0; gamma0];

[t,y] = ode45(@(tin,yin) state_eqs(tin,yin,CD0,K,S,rho,m,g), tspan, y0);

figure;

subplot(2, 2, 1);
plot(t, y(:, 1));
title('X-coordinate');

subplot(2, 2, 2);
plot(t, y(:, 2));
title('Altitude h');

subplot(2, 2, 3);
plot(t, y(:, 3));
title('Velocity v');

subplot(2, 2, 4);
plot(t, y(:, 4));
title('Flight Path Angle Gamma');

% Plot altitude h and x-coordinate together
figure;
plot(y(:, 1), y(:, 2));
xlabel('X-Coordinate');
ylabel('Altitude h');
title('Flight Path');

%%%%%%%% EXERCISE 3 %%%%%%%%
%%% i)

%x0_vals = [0, 1, 2];
%h0_vals = [];
%v0_vals = [100, 150, 200];
%gamma0_vals = [];

%results = [];

%for x0 = x0_range
%    for h0 = h0_range
%        for v0 = v0_range
%            for gamma0 = gamma0_range
%                % simulation
%            end
%        end
%    end
%end

