T_out = 30.57;
T_set = 26;
H = 0.13 * 242;
Kp = linspace(0.1, 200, 500);
T_end = (H * T_out + Kp .* T_set) ./ (H + Kp);
T_error = T_end - T_set;

figure;

subplot(2,1,1);
plot(Kp, T_end, 'Color', [0.85 0.33 0.1], 'LineWidth', 2);
xlabel('K_p value');
ylabel('Final Temp (°C)');
title('Temp vs K_p');
grid on;
ylim([25 31]);

subplot(2,1,2);
plot(Kp, T_error, 'Color', [0 0 0.5], 'LineWidth', 2);
xlabel('K_p value');
ylabel('Error (°C)');
title('Error vs K_p');
grid on;
ylim([-1 6]);
