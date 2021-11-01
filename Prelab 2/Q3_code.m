%% House cleaning
clc; clear all; close all;

%% Given 
Tx = [18.53 22.47 26.87 30.05 35.87 38.56 41.50 46.26];
%in diagram thermocouples Th1 to Th8 are 0.5 in apart
xvals = [1.375 1.875 2.375 2.875 3.375 3.875 4.375 4.875];
%% Determine line best fit
ht = polyfit(xvals,Tx,1);
x1 = [ 0 1.375 1.875 2.375 2.875 3.375 3.875 4.375 4.875];
y1 = polyval(ht,x1);
T_0 = y1(1);
figure(1)
plot(xvals,Tx,'*')
hold on 
plot(x1,y1)
hold on 
title('Temperature vs Distance')
xlabel('Linear Distance x (in)')
ylabel('Temperature Reading (deg C)')
legend('Given Data','Line of Best Fit','Location','northwest')
hold off
fprintf('T_0: %0.3f \n',T_0)
fprintf('H: %0.3f \n',ht(1))
