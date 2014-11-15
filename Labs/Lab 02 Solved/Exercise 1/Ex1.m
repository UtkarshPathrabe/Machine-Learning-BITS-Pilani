clear; clear all; clc;
X = 0.01:0.01:1;
m = length(X);
phi = ones(m,1);
for i = 1:m
    phi = [phi polyBasis(X, i)];
end
plot(X, phi);
disp(phi);
fprintf('Polynomial Basis Function Done!\nProgram Paused, Press Enter to Continue\n');
pause;

clear; clear all; clc;
X = 0.01:0.01:1;
m = length(X);
phi = ones(m,1);
for i = 1:m
    phi = [phi gaussianBasis(X, i)];
end
plot(X, phi);
disp(phi);
fprintf('Gaussian Basis Function Done!\nProgram Paused, Press Enter to Continue\n');
pause;

clear; clear all; clc;
X = 0.01:0.01:1;
m = length(X);
phi = ones(m,1);
for i = 1:m
    phi = [phi sigmoidBasis(X, i)];
end
plot(X, phi);
disp(phi);
fprintf('Sigmoidal Basis Function Done!\nProgram Paused, Press Enter to Continue\n');
pause;