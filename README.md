# Temperature Control and Energy Performance of a Standalone Air Conditioning System

## Overview

This repository contains MATLAB simulations and analyses for a standalone air-conditioning system used in a school setting in downtown Colombo. The work focuses on temperature control strategies and their impact on energy performance.

The study models the behavior of on-off and inverter-type air conditioners under different operating conditions and control strategies, including Proportional (P) and Proportional-Integral (PI) controllers.

---

## Assignment Background

The school has 36 identical classrooms, each with dimensions:

- Length: 10 m
- Width: 8 m
- Height: 4.5 m

Two on-off type split air conditioners (each rated at 12,000 BTU/hr) are installed in each classroom. Initial indoor temperature was 31℃, outdoor temperature 32℃, with a setpoint of 20℃.

Operational details:

- School operates weekdays, pre-lunch (08:00-11:00), lunch break (11:00-12:00, AC off), post-lunch (12:00-14:00)
- 210 operating days per year
- Power consumption of AC units and fans recorded
- Temperature distribution histogram during operation provided

---

## Objectives

- Model why air conditioners worked in bypass mode under given test conditions.
- Estimate annual energy consumption and costs.
- Analyze energy savings by adjusting set temperature to 26℃.
- Compare on-off and inverter-type AC units regarding energy efficiency.
- Implement and simulate P and PI control strategies for inverter-based systems.
- Perform energy consumption calculations for inverter units.

---

## Repository Contents

- `TemperatureControl_Simulation.m` — Main MATLAB script including all simulations.
- MATLAB functions for:
  - On-off control modeling
  - P controller simulation
  - PI controller simulation
- Plots illustrating:
  - Temperature changes over time
  - Controller performance comparisons
  - Energy consumption vs. duty cycle
- Detailed comments and explanations within code for clarity.

---

## How to Use

1. Open the main MATLAB script (`TemperatureControl_Simulation.m`) in MATLAB.
2. Run the script to reproduce all plots and results.
3. Modify parameters (e.g., set temperature, outdoor temperature) to explore different scenarios.
4. Review plots to analyze controller performance and energy consumption.

---

## Key Features

- Modeling of thermal dynamics of classrooms with air conditioners.
- Simulation of on-off vs inverter control strategies.
- Comparative analysis of P and PI controllers.
- Energy consumption estimation and cost analysis.
- Well-documented MATLAB code for reproducibility.

---

## Assumptions

- Thermal properties and parameters based on ASHRAE handbook data.
- Constant heat transfer coefficient (U) for walls and ceiling.
- Inverter AC units consume between 300 W to 1200 W depending on operation.
- Hysteresis band width for on-off control is 1℃.
- School’s operating hours and days as specified.

---

## License

This project is for educational purposes. Feel free to use and modify the code for your learning.

---
