clc; clear all;
L = 5.875; %in
H = 7.861; 
T_0 = 7.949; %deg C
alph = [0.02,0.05,0.0747,0.1];
lambda = pi/(2*L);
bn =@(n) (-8*H*L*(-1)^(n-1))/((2*n-1)*pi)^2;

x = 4.875;
emptyCell = cell(1,3,1);
%sumation
 yeet = zeros(1,1000);
 for i = 1:4
    a = alph(i);
    for t = 1:1000
       sum = bn(1)*sin(lambda*x)* exp(-(lambda^2)*a*t);
       yeet(t) = T_0 + H*x + sum;
    end
    emptyCell(1,i,1) = mat2cell(yeet,1,1000);
 end


figure
plot(1:1000,cell2mat(emptyCell(1,1,1)))
hold on
plot(1:1000,cell2mat(emptyCell(1,2,1)))
hold on 
plot(1:1000,cell2mat(emptyCell(1,3,1)))
hold on
plot(1:1000,cell2mat(emptyCell(1,4,1)))
xlabel('time t (s)')
ylabel('Temperature deg C')
title('Predicted temperature of Thermalcouple 8 with varying thermal diffusivity')
legend('alpha = 0.02','alpha = 0.05','alpha = 0.0747','alpha = 0.1')