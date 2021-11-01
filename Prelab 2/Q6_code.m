clc; clear all;
L = 5.875; %in
H = 7.861; 
T_0 = 7.949; %deg C
alph = 0.0747;
lambda = pi/(2*L);
bn =@(n) (4*H*L*(-1)^(n-1))/((2*n-1)*pi);

x = 4.875;

%sumation
 yeet = zeros(1,10);
 
 for t = 1:100
    sum = 0;
    for j = 1:10
        sum = sum + bn(j)*sin(lambda*x)* exp(-(lambda^2)*alph*t);
    end
    yeet(t) = sum;
 end
temp = zeros(1,100);
for i = 1:100
    temp(i) = T_0 + H*x + yeet(i);
end

figure
plot(1:100,temp)
hold on
xlabel('time t (s)')
ylabel('Temperature deg C')
title('Predicted temperature of Thermalcouple 8 over 100 seconds')