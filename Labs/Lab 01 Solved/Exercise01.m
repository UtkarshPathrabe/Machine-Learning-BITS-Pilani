% For 10 data points
clear; close all; clc;
n = 20;                         %Change Here for number of Training points
m = 20;                         %Change Here for number of Testing points
x1 = (10/n:10/n:10);
y1 = sin(x1)+normpdf(x1,0.5,1.2);
scatter(x1,y1), xlabel('x'),ylabel('y'),axis([0 11 -1 1.5]),title('Training Data');
fprintf('Program paused. Press enter to continue.\n');
pause;
x2 = sort(10*rand(1, m));
y4 = sin(x2)+normpdf(x2,0.5,1.2);
scatter(x2,y4), xlabel('x'),ylabel('y'),axis([0 11 -1 1.5]),title('Testing Data');
fprintf('Program paused. Press enter to continue.\n');
pause;
y1 = y1';
y4 = y4';
l1 = zeros(1, 10);
l2 = zeros(1, 10);
r1 = zeros(1, 10);
r2 = zeros(1, 10);
for k = 1:10
   for i = 1:k
       X1(:,i)=x1'.^i;
       X2(:,i)=x2'.^i;
   end
   X1 = [ones(n, 1) X1];
   X2 = [ones(m, 1) X2];
   a = ((X1'*X1)\X1')*y1;
   fprintf('The matrix X for k = %d is:\n', k);
   disp(X1);
   fprintf('and the vector A is:\n');
   disp(a);
   y2 = X1*a;
   y5 = X2*a;
   y3 = y1-y2;
   y6 = y4-y5; 
   TrainLSE = sumsqr(y3);
   TestLSE = sumsqr(y6);
   TrainRMSE = sqrt(TrainLSE/n);
   TestRMSE = sqrt(TestLSE/n);
   l1(1,k) = TrainLSE;
   l2(1,k) = TestLSE;
   r1(1,k) = TrainRMSE;
   r2(1,k) = TestRMSE;
   fprintf('The Least Square Training Error is ');disp(TrainLSE);
   fprintf('The Root Mean Square Training Error is ');disp(TrainRMSE);
   fprintf('The Least Square Testing Error is ');disp(TestLSE);
   fprintf('The Root Mean Square Testing Error is ');disp(TestRMSE);
   fprintf('\n');
end
k = (1:1:10);
subplot(1,2,1)
plot(k,l1,k,l2,'.-'),xlabel('k'),ylabel('LSE'),grid on,axis([0 11 0 50]),legend('Training Error','Testing Error');
hold on;
subplot(1,2,2)
plot(k,r1,k,r2,'.-'),xlabel('k'),ylabel('RMSE'),grid on,axis([0 11 0 1.5]),legend('Training Error','Testing Error');
hold off;