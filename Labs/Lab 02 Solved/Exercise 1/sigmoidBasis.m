function phiX = sigmoidBasis(X, j)
    X = X';
    s = 1;
    muj = ones(length(X),1)*X(j,1);
    phiX = sigmoid((X-muj)/s);
end