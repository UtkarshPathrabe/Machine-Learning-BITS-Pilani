function J = CostFunction(X, y, theta)
    m = length(y); 
    J = (-1/m)*((y'*log(sigmoid(X*theta))) + ((1-y)'*log(1 - sigmoid(X*theta))));
end