close all
clear

tspan = [0,150];

% State variables
x0 = 0; % m
h0 = 200;
v0 = 20; % m/s
gamma0 = 0; %pi/4;

y0 = [x0; h0; v0; gamma0];

[t,y] = ode45(@state_eqs, tspan, y0);

x = y(:,1);
h = y(:,2);
v = y(:,3);
gamma = y(:,4);

% find t when crashing
tend = t(length(t));
idx = find(h <= 0);
if ~isempty(idx) % did not crash during sim
    tend = t(idx(1));
end


figure;

subplot(2, 2, 1);
plot(t, x);
xline(tend,'r')
title('X-coordinate');

subplot(2, 2, 2);
plot(t, h);
yline(0,'black')
xline(tend,'r')
title('Altitude h');

subplot(2, 2, 3);
plot(t, v);
xline(tend,'r')
title('Velocity v');

subplot(2, 2, 4);
plot(t, gamma);
xline(tend,'r')
title('Flight Path Angle Gamma');

% Plot altitude h and x-coordinate together
figure;
plot(x, h);
yline(0,'black')
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

