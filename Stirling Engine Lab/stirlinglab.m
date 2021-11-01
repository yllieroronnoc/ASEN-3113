%% Housekeeping
clear
close all
clc

%% Assumptions
%Ideal Gas

%% Read in the Stirling Engine Data
%Define the filenames
fn1 = 'DelTemp8';
fn2 = 'DelTemp10';
fn3 = 'DelTemp12';

%Read in the data
mat1 = xlsread(fn1);
mat2 = xlsread(fn2);
mat3 = xlsread(fn3);

%% Do RPM Analysis 
rpm1 = rpmanalysis(mat1(:,1),mat1(:,8));
rpm2 = rpmanalysis(mat2(:,1),mat2(:,8));
rpm3 = rpmanalysis(mat3(:,1),mat3(:,8));

%% Read in the Motion Analysis Data
% RPM 72
%Read in the displacement of the power piston
powermat = xlsread('PowerPistonLinearDisplacement72');
%Check to make sure that the motion analysis ran correctly
rpmcheck = xlsread('HoleAngularDisplacement72');
rpmcheck(:,3) = rpmcheck(:,3)/360;
rpmcheck(:,2) = rpmcheck(:,2)/60;
rpm = rpmcheck(:,3)./rpmcheck(:,2);

%% Analyze
% RPM 72

%Find the displacements of the power piston
zerodisp = powermat(1,3);
disp = powermat(:,3) - zerodisp;
disp = disp/1000; %convert to m

%Calculate the volume
r = .0075; %m
vol = disp*pi*r^2; %m^3

%Trim the volume
vol = vol(1:2*find(vol > 0,1));
time = powermat(1:length(vol),2);
%% Line Up the Data
mat1 = mat1(find(mat1(:,8) == 1,1):end,:);
%Rezero the time
mat1(:,1) = mat1(:,1) - mat1(1,1);
t = 60/rpm1; %seconds per cycle

mat1 = mat1(1:find(mat1(:,1) >= t),:);

vol = interp1(time,vol,mat1(:,1)) + 1.737*10^-4;
pres = mat1(:,2) * 6894.76 + 84000; %convert to pa
%% Plot
figure(1)
plot(vol,pres)
xlabel('yeet')
polyarea(vol,pres)