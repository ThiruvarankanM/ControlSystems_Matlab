clc;
clear;
close all;

U = 0.13 / 60;
A = 242;
m = 10 * 8 * 4.5 * 1.18;
c = 1;

Kp = 140;
T_out = 32;
T_set_initial = 25;
T_set_final = 26;
T_init = 35;
I_init = 0;

t_sim = linspace(0, 100, 10000);
init_state = [T_init; I_init];

K_i_values = [0.5, 1.0, 1.5, 2.0, 2.5];

figure;
hold on;

for K_i = K_i_values
    [t, y] = ode15s(@(t, y) pi_control_model(t, y, U, A, m, c, Kp, K_i, T_out, T_set_initial, T_set_final), ...
                    t_sim, init_state, odeset('MaxStep', 0.005));
    plot(t, y(:,1), 'LineWidth', 2, 'DisplayName', ['K_i = ' num2str(K_i)]);
end

xlabel('Time (minutes)');
ylabel('Indoor Temperature (°C)');
title('PI Controller Response for Varying Ki (Kp = 140)');
legend('Location', 'best');
grid on;
hold off;

function dydt = pi_control_model(t, y, U, A, m, c, Kp, K_i, T_ext, T_target_initial, T_target_final)
    temp = y(1);
    integral_error = y(2);

    if t > 10
        T_target = T_target_final;
    else
        T_target = T_target_initial;
    end
    
    error = T_target - temp;
    Q = Kp * error + K_i * integral_error;

    dydt = zeros(2, 1);
    dydt(1) = (U * A * (T_ext - temp) + Q) / (m * c);
    dydt(2) = error;
end
