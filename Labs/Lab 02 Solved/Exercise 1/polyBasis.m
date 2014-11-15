function phiX = polyBasis(X, j)
    X = X';
    phiX = X.^j;
end