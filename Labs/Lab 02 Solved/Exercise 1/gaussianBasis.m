function phiX = gaussianBasis(X, j)
    X = X';
    s = 1;
    muj = ones(length(X),1)*X(j,1);
    phiX = exp(-((X-muj).^2)/(2*(s^2)));
end