function [mu sigma2] = estimateGaussian(X)

[m, n] = size(X);
mu = zeros(n, 1);
sigma2 = zeros(n, 1);

meanmat = (1/m) * sum(X); 
mu = meanmat'; 

sigmasquare = (1/m) * sum((X-meanmat).^2); 
sigma2 = sigmasquare';

end
