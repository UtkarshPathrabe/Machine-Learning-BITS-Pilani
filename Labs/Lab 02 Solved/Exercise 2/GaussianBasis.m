function phiX = GaussianBasis(X, j, s)
    X = X';
    muj = ones(length(X),1)*X(j,1);
    phiX = exp(-((X-muj).^2)/(2*(s^2)));
end