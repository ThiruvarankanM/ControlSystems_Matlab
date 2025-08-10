U = 0.13;
A = 242;
Q = 42.19987;
m = 10 * 8 * 4.5 * 1.18;
c = 1;
theta_out = 32;
theta0 = 31;

dtheta_dt = @(t, theta) (U*A/(m*c)) * (theta_out - theta) - Q/(m*c);

t_min = [0, 60];

[t, theta] = ode45(dtheta_dt, t_min, theta0);

plot(t, theta, 'Color', [0.2 0.6 0.1], 'LineWidth', 2);
xlabel('Time (minutes)');
ylabel('Room Temperature (°C)');
title('Room Temperature Change Over Time');
grid on;
