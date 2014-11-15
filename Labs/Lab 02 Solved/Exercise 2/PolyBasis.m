function phiX = PolyBasis(X, j)
    X = X';
    phiX = X.^j;
end