function [rpm] = rpmanalysis(t,encod)

%Trim the beginning since it is unknown at what position data collection
%started
t = t(find(encod == 1,1):end);
encod = encod(find(encod == 1,1):end);

%Determine the time span
T = diff(encod);
dt = t(T==1)-t(1); %find the time of the next 1 that the encoder reads
dt = dt(1);
rpm = 60/dt; % 1 rotation / seconds * 60 seconds / min
end