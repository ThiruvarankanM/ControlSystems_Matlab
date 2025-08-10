UA = 0.13 * 242;
theta_out = 30;
theta_set = 26;
m = 10 * 8 * 4.5 * 1.18;
c = 1;
tspan = [0 200];
x0 = [31; 0];
Kp = 10;
Ki = 1200;

odefun = @(t, x) [
    (UA * (theta_out - x(1)) + Kp * (theta_set - x(1)) + Ki * x(2)) / (m * c);
    theta_set - x(1)
];

[t, x_pi] = ode45(odefun, tspan, x0);

t_on_off = linspace(0, 200, 200);
theta_on_off = 31 + (theta_set - 31) * (1 - exp(-t_on_off / 20));

figure;
subplot(2,1,1);
plot(t, x_pi(:,1), 'b', 'LineWidth', 2);
hold on;
plot(t_on_off, theta_on_off, 'r--', 'LineWidth', 2);
xlabel('Time (minutes)');
ylabel('Temperature (°C)');
title('Temperature vs Time: On-Off vs Inverter (P and PI Control)');
legend('Inverter (PI)', 'On-Off');
grid on;

subplot(2,1,2);
plot(t, abs(x_pi(:,1) - theta_set), 'b', 'LineWidth', 2);
hold on;
plot(t_on_off, abs(theta_on_off - theta_set), 'r--', 'LineWidth', 2);
xlabel('Time (minutes)');
ylabel('Error (°C)');
title('Error vs Time: On-Off vs Inverter (P and PI Control)');
legend('Inverter (PI)', 'On-Off');
grid on;
