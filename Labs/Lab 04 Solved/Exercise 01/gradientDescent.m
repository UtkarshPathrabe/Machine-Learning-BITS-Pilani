function theta = gradientDescent(X, y, theta, alpha, num_iters)
    m = length(y);
    for iter = 1:num_iters
        theta = theta - ((alpha/m)*(X' * ((X*theta)-y)));
    end
end