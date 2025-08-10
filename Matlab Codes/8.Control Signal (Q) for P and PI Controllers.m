clc;
clear;
close all;

U = 0.13 / 60;
A = 242;
m = 10 * 8 * 4.5 * 1.18;
c = 1;

T_out = 32;
T_set_initial = 25;
T_set_final = 26;
T_init = 35;
I_init = 0;

t_sim = linspace(0, 100, 10000);
init_state = [T_init; I_init];

Kp = 140;
Ki = 0; % For P controller
K_i_values = [0.5, 1.0, 1.5, 2.0, 2.5]; % For PI controller

% P Controller Analysis
figure;
hold on;
for Kp = Kp
    [t, y] = ode15s(@(t, y) control_signal_model(t, y, U, A, m, c, Kp, Ki, T_out, T_set_initial, T_set_final), ...
                   t_sim, init_state, odeset('MaxStep', 0.005));
    plot(t, y(:,1), 'LineWidth', 2, 'DisplayName', ['P Controller (Kp = ' num2str(Kp) ')']);
end

% PI Controller Analysis
for K_i = K_i_values
    [t, y] = ode15s(@(t, y) control_signal_model(t, y, U, A, m, c, Kp, K_i, T_out, T_set_initial, T_set_final), ...
                    t_sim, init_state, odeset('MaxStep', 0.005));
    plot(t, y(:,1), 'LineWidth', 2, 'DisplayName', ['PI Controller (Ki = ' num2str(K_i) ')']);
end

xlabel('Time (minutes)');
ylabel('Control Signal (Q)');
title('Control Signal (Q) vs Time for P and PI Controllers');
legend('Location', 'best');
grid on;
hold off;

function dydt = control_signal_model(t, y, U, A, m, c, Kp, Ki, T_ext, T_target_initial, T_target_final)
    temp = y(1);
    integral_error = y(2);

    if t > 10
        T_target = T_target_final;
    else
        T_target = T_target_initial;
    end
    
    error = T_target - temp;
    Q = Kp * error + Ki * integral_error;

    dydt = zeros(2,1);
    dydt(1) = (U * A * (T_ext - temp) + Q) / (m * c);
    dydt(2) = error;
end
