% Computes the value of the functional J[x(h)] (eq. 2)* for a given curve
%
% * actually J[h(x)] is computed here instead, with necessary modifications 
% having been made (i.e. change to an integral in x)
%
% Sergio Maldonado 2019
% University of Southampton
%
% supplementary code to:
% Maldonado, S. and Uchasara, M. (2019) On the thermodynamics-based
% equilibrium beach profile derived by Jenkins and Inman (2016). arXiv:1908.07825

clear variables
clc
close all

%input data ==============================================

% beach profile:
dire  = '/some/folder/here/';
file = 'somecurve.dat';

n = 1.479;

%input data ==============================================

cd(dire)

m = -3*(n + 1)/4;

pr = importdata(file);

x = pr(:,1);
h = pr(:,2);

% central scheme:
dhdx = (h(3:end) - h(1:end-2))./(x(3:end) - x(1:end-2));
dhdx = [dhdx(1) ; dhdx ; dhdx(end)];

L = (h.^m).*sqrt(1 + dhdx.^2);

% functional is
F = trapz(x,L);

disp('The value of the functional is:')
disp(F)

% plots for reference:
figure
plot(x,h,'-k')
title('beach profile')
xlabel('x (m)')
ylabel('h (m)')

figure
plot(x,dhdx)
title('slope of the profile dh/dx')
xlabel('x (m)')
ylabel('dh/dx')
