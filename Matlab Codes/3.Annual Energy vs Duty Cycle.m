duty_cycle = linspace(0.5, 1, 100);
power_kw = 2.932;
daily_minutes = 300;
energy_daily = (power_kw / 60) * (47.96 + duty_cycle * (daily_minutes - 47.96));
energy_annual = energy_daily * 210;

figure;
plot(duty_cycle, energy_annual, 'b', 'LineWidth', 2);
xlabel('Duty Cycle');
ylabel('Annual Energy (kWh)');
title('Annual Energy Consumption vs Duty Cycle');
grid on;
