% return p(x|y) 
function [ out ] = p(x,y,L )

%out = max(0, 1- 1*distance(x,y,L)/L); 
%out = ones(1,max(length(x),length(y)));%-distance(x,y,L); % exponential
%out = exp(-distance(x,y,L).^1/.1); 
out = 1 -  distance(x,y,L).^2/L; 
%out = max(out,0);



end

