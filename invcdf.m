function r = invcdf(x,cdf,nr,cont)
% function r = invcdf(x,cdf,nr,cont);
% The function calculates samples from a distribution numerically given
% by (x,cfd) by using the inverse CDF method.
% INPUT       x       points where the numerical CDF values are given
%             cdf     the CDF values
%             nr      nunber of samples to be generated
%             cont    1: continuous distribution, DEFAULT
%                     2: discrete distribution
% OUTPUT       r      samples from the distribution given/approximated
%                     by (x,cfd). 

 xi = x; cdfi = cdf;
 if (nargin==3); cont = 1; end

 rr = rand(nr,1);
  for i=1:nr; 
     ind  = sum(rr(i)>cdfi)+1;
     if (ind==1 | cont == 2)
        r(i) = xi(ind);
    else
        r(i) = xi(ind-1) + (xi(ind)-xi(ind-1))...
                      /(cdfi(ind)-cdfi(ind-1))*(rr(i)-cdfi(ind-1));
     end
  end
 
  
  end 