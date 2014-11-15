function phiX = SigmoidBasis(X, j, s)
    X = X';
    muj = ones(length(X),1)*X(j,1);
    phiX = Sigmoid((X-muj)/s);
end