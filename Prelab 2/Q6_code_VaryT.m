clc; clear all;
L = 5.875; %in
H = 7.861; 
T_0 = 7.949; %deg C
alph = 0.0747;
lambda = pi/(2*L);
bn =@(n) (-8*H*L*(-1)^(n-1))/((2*n-1)*pi)^2;

x = 4.875;

%sumation
yeet = zeros(1,1000);
 
 for t = 1:1000
    sum = bn(1)*sin(lambda*x)* exp(-(lambda^2)*alph*t);
    yeet(t) = sum;
 end
 temp = zeros(1,1000);

for i = 1:1000
    temp(i) = T_0 + H*x + yeet(i);
end

figure
plot(1:1000,temp)
hold on
xlabel('time t (s)')
ylabel('Temperature deg C')
title('Predicted temperature of Thermalcouple 8 over 1000 seconds')