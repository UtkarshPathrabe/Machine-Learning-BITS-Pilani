clear; clear all; clc;
X = 0.01:0.01:1;
Y = sin(X) + normpdf(X, 0.5, 1);
scatter(X,Y), xlabel('x'),ylabel('y'),title('Training Data');
fprintf('Program paused. Press enter to continue.\n');
pause;
Y = Y';
m = length(X);
LSE = zeros(1,15);
k = 1;
for s = 0.1:0.1:1.5
    phi = ones(m,1);
    for i = 1:m
        phi = [phi SigmoidBasis(X, i, s)];
    end
    w = pinv(phi'*phi)*(phi'*Y);
    Y1 = phi*w;
    LSE(1,k) = sumsqr(Y - Y1);
    k = k+1;
end
s = 0.1:0.1:1.5;
plot(s, LSE),xlabel('s'),ylabel('Least Square Error');