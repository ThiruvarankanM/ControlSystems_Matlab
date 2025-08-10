U = 0.13;
A = 242;
m = 10 * 8 * 4.5 * 1.18;
c = 1;
K1 = 17.1561;
theta_set = 20;
theta_low = theta_set - 0.5;
theta_high = theta_set + 0.5;

tau = (m * c) / (U * A);

t1 = 0:0.1:23.98;
t2 = 0:0.1:1.25;
t3 = 0:0.1:4.8;

theta1 = (31 - K1) * exp(-U*A*t1/(m*c)) + K1;
theta2 = (theta_low - 30.57) * exp(-U*A*t2/(m*c)) + 30.57;
theta3 = (theta_high - K1) * exp(-U*A*t3/(m*c)) + K1;

t_total = [t1, t1(end)+t2, t1(end)+t2(end)+t3];
theta_total = [theta1, theta2, theta3];

figure;
plot(t_total, theta_total, 'm', 'LineWidth', 2);
xlabel('Time (minutes)');
ylabel('Room Temperature (°C)');
title('Temperature Fluctuation with On-Off Controller');
grid on;
