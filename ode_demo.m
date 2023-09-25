
tspan = [0, 60];
y0 = [1;0];
[tout,yout] = ode45(@odefun,tspan,y0);

plot(tout, yout(:, 1))

function dy = odefun(t, y)
dy = [y(2); -y(1) - y(2)/10 + t/100];
end
