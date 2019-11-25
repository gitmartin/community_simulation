function [ deltas_dot ] = delta_diffeq( t,deltas )
% This function defines the differential equation. Given deltas (2x1
% vector),  return the rate of change of deltas ( [delta_d; delta_s] ). 


t % print out progress

L = 1; 
c = 0.95;
L_I = 0.1;

grid = 1000; % divide up interval into 1000 points

% consumption edge utilities of the two communities
UC1d_of_dd = calcUC1d(deltas,L,c,L_I,grid);
UC2d_of_dd = calcUC2d(deltas,L,c,L_I,grid);
%(UC1d_of_dd + UC2d_of_dd);

% production edge utilities of the two communities
UC1s_of_ds = calcUC1s(deltas,L,c,L_I,grid);
UC2s_of_ds = calcUC2s(deltas,L,c,L_I,grid);
%(UC1s_of_ds + UC2s_of_ds);

% derivatives are utility differences
deltas_dot(1,1) =  (UC1d_of_dd - UC2d_of_dd); %/UC2d_of_dd;
deltas_dot(2,1) =  (UC1s_of_ds - UC2s_of_ds); %/UC2s_of_ds;


% when delta_d or delta_s get close to L_I, the code below makes the
% derivatives smaller to avoid numerical issues...
if deltas(1) >= L_I*.9 && deltas_dot(1) >= 0
    deltas_dot(1) = deltas_dot(1)*(L_I-deltas(1))/(.1*L_I);
end
if deltas(2) >= L_I*.9 && deltas_dot(2) >= 0
    deltas_dot(2) = deltas_dot(2)*(L_I-deltas(2))/(.1*L_I);
end


end
