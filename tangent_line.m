CD0 = 0.034;
K = 0.07;

x = linspace(-0.5, 2, 1000);
y = CD0 + K * x.^2;

x1 = sqrt(CD0 / K);
y1 = CD0 + K * x1^2;
y_tangent = 2 * K * sqrt(CD0 / K) * x;

set(groot, 'DefaultLineLineWidth', 2);
set(groot, 'DefaultAxesFontSize', 14);
set(groot, 'DefaultTextFontSize', 14);

figure;
hold on;
grid on;
set(gcf, 'Position', [100, 100, 650, 450]);

plot(x, y, 'b-', 'DisplayName', 'Drag Coefficient');
plot(x, y_tangent, 'r--', 'DisplayName', 'Tangent Line');
scatter(x1, y1, 75, 'black', 'filled', 'DisplayName', 'Tangent Point');

label = sprintf('(%.3f, %.3f)', x1, y1);
text(x1-0.5, y1+0.015, label);

l1 = xline(0,'black','LineWidth',2);
l2 = yline(0,'black','LineWidth',2);
set(l1, 'HandleVisibility', 'off');
set(l2, 'HandleVisibility', 'off');

xlabel('C_L');
ylabel('C_D');
legend('Location', 'best');

print('tangent', '-dpng', '-r300');
