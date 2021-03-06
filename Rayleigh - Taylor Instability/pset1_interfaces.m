% A short code to retrieve both interface and energy data from the Basilisk
% Rayleigh-Taylor solver and plot them
clear all;
clc;

%%% Plotting Interface Data %%%

% Import simulation results, and change the file, assuming you are
% already in MAE563/Rayleigh - Taylor Instability
interface_results = importdata('rho2_gt_rho1/twomodes-highunstable/results2.00_0.dat');
% [m1,n1] = size(interface_results);
% fprintf("The size of the raw data is %d by %d\n", m1, n1);

x1 = interface_results(:,1);
y1 = interface_results(:,2);

% Set Up the Figure
scatter(x1,y1,7,'filled','m');

% Add legend, axes, grid, and title
grid on
xlabel('x');
ylabel('z');
legend('t = 0.0','t = 0.5','t = 1.0','t = 1.5','t = 2.0')
title("Interfaces for RT Instability");

%%% Plotting Energy %%%

% Import simulation results
energy_results = importdata('rho2_gt_rho1/twomodes-highunstable/budgetFluid1.dat');
energy_results = energy_results.data(2:end,1:2);
%[m1,n1] = size(energy_results);
%fprintf("The size of the raw data is %d by %d\n", m1, n1);

% Create two vectors to be plotted
x2 = energy_results(:,1);
y2 = energy_results(:,2);

% Now plot energy
scatter(x2,y2,7,'filled','k')
% plot(x,y)
ylabel('Energy (E)');
xlabel('time (t)');
titlestr = sprintf("Energy for RT Instability");
title(titlestr);
grid on

% Optional include legend
legend('\gamma = 0.1, g = 10','\gamma = 0.05, g = 10','\gamma = 0.05, g = 12')

%%% Collapsing Energy Curves %%%

clear all
clf
% Import data from simulation
energy_results1 = importdata('rho2_gt_rho1/unstable/budgetFluid1run1.dat');
energy_results1 = energy_results1.data(2:end,1:2);
ex1 = energy_results1(:,1);
ey1 = energy_results1(:,2);
energy_results2 = importdata('rho2_gt_rho1/unstable/budgetFluid1run2.dat');
energy_results2 = energy_results2.data(2:end,1:2);
ex2 = energy_results2(:,1);
ey2 = energy_results2(:,2);
energy_results3 = importdata('rho2_gt_rho1/unstable/budgetFluid1run3.dat');
energy_results3 = energy_results3.data(2:end,1:2);
ex3 = energy_results3(:,1);
ey3 = energy_results3(:,2);

% Maximum growth rates
gr1 = 10.0;
gr2 = 35;
gr3 = 90;

% Now rescale the energy values
ry1 = ey1./gr1;
ry2 = ey2./gr2;
ry3 = ey3./gr3;

%Now plot
hold on
%scatter(ex1,ey1,7,'filled','b')
scatter(ex1,ry1,7,'filled','k')
%scatter(ex2,ey2,7,'filled','c')
scatter(ex2,ry2,7,'filled','b')
%scatter(ex3,ey3,7,'filled','r')
scatter(ex3,ry3,7,'filled','r')
ylabel('Energy (E)');
xlabel('time (t)');
xlim([0 3.5])
titlestr = sprintf("Energy for RT Instabilities - Rescaled");
title(titlestr);
legend('\gamma = 0.1, g = 10','\gamma = 0.05, g = 10','\gamma = 0.05, g = 12')
grid on
hold off




% Fit an exponential to the early part of energy
ex1_cut = ex1(1:2575);
ey1_cut = ey1(1:2575);
ex2_cut = ex2(1400:4000);
ey2_cut = ey2(1400:4000);
ex3_cut = ex3(1:2575);
ey3_cut = ey3(1:2575);