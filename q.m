% return q(x|y)
function [ out ] = q(x,y,L )

out = 1  -  1*distance(x,y,L).^2/L; 
%out = out .* (distance(x,y,L) < .1);
%out = ones(1,max(length(x),length(y)));
%out = exp(-distance(x,y,L)/4); % exponential
%out = exp(-distance(x,y,L).^2/.1);
%out = max(0, 1-4*distance(x,y,L).^2); 




end

