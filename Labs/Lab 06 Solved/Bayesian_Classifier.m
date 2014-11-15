clc;    clear all;  close all;
data = load('Data.txt');
y = data(:,5);
X = data(:,1:4);
[m, n] = size(X);
Prob_y_1 = sum(y)/m;
Prob_y_0 = 1 - Prob_y_1;
Prob_X_y_1 = zeros(1,n);
Prob_X_y_0 = zeros(1,n);
for i = 1:n
    for j = 1:m
        if y(j) == 1
            Prob_X_y_1(i) = Prob_X_y_1(i) + X(j,i);
        else
            Prob_X_y_0(i) = Prob_X_y_0(i) + X(j,i);
        end
    end
end
Prob_X_y_1 = prod(Prob_X_y_1./sum(y));
Prob_X_y_0 = prod(Prob_X_y_0./(m - sum(y)));
Prob_X = Prob_X_y_1 + Prob_X_y_0;
Prob_y_1_X = (Prob_X_y_1 * Prob_y_1) / Prob_X;
Prob_y_0_X = (Prob_X_y_0 * Prob_y_0) / Prob_X;
disp(Prob_y_1_X);
disp(Prob_y_0_X);