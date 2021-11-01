clc; clear all;
L = 5.875; %in
H = 7.861; 
T_0 = 7.949; %deg C
alph = 0.0747;
lambda =@(n)((2*n-1)*pi)/(2*L);
bn =@(n) (-8*H*L*(-1)^(n-1))/((2*n-1)*pi)^2;

x = 4.875;
t = 1;
%sumation
 yeet = zeros(1,10);
for i = 1:10
    sum = 0;
    for j = 1:i
        sum = sum + bn(j)*sin(lambda(j)*x)* exp(-(lambda(j)^2)*alph*t);
    end
    yeet(i) = sum;
end
temp = zeros(1,10);
for i = 1:10
    temp(i) = T_0 + H*x + yeet(i);
end

figure
plot(1:10,temp,'*')
hold on
xlabel('n value')
ylabel('Temperature deg C')
title('n value vs temperature with t value of 1000')
