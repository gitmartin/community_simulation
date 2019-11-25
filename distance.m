% returns min( |x-y| , 2L - |x-y| )
function [out] = distance( x, y, L )
% assume x,y row vectors if they're vectors

a = abs(x-y); 
b = 2*L - abs(x-y);
out = min([a;b]);

end

