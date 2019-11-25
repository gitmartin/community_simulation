
%% Plotting edge consumption utility as a function of interval size for an interval community
L = 1; c = 0.95;
L_I = .25;
grid = 1000; 

deltas= [0.0; 0.0];
edge_consumption_utility = [];
interval_size = 0.01:.01:.4;
for interval_size_val = 0.01:.01:.4
    edge_consumption_utility(end+1) = ...
        % keep deltas = 0, change only L_I. We're just interested in one
        % interval community here. 
        calcUC1d(deltas,L,c,interval_size_val,grid);
    
end

plot(interval_size, edge_consumption_utility)


% ignore the stuff below...

%%
L = 1; c = 0.95;
L_I = .25;
grid = 1000; % divide up interval into 500 points

clc

deltas= [0.0; 0.0];


UC1d_of_dd = calcUC1d(deltas,L,c,L_I,grid)
UC2d_of_dd = calcUC2d(deltas,L,c,L_I,grid);
(UC1d_of_dd + UC2d_of_dd);

UC1s_of_ds = calcUC1s(deltas,L,c,L_I,grid);
UC2s_of_ds = calcUC2s(deltas,L,c,L_I,grid);
(UC1s_of_ds + UC2s_of_ds);


(UC1d_of_dd - UC2d_of_dd)%/UC2d_of_dd
(UC1s_of_ds - UC2s_of_ds)%/UC2s_of_ds

%%
clear
L = 1; 
c = 0.95;
L_I = .24;
grid = 1000; % divide up interval into 500 points
[X,Y] = meshgrid(0:.02:.35, 0:0.02:.40);
[X,Y] = meshgrid(.16:.001:.17, .19:.001:.20);
Z = [];
for row = 1:size(X,1)
    for col = 1:size(X,2)
        deltas = [X(row,col), Y(row,col)];
        UC1d_of_dd = calcUC1d(deltas,L,c,L_I,grid);
        UC2d_of_dd = calcUC2d(deltas,L,c,L_I,grid);
        UC1s_of_ds = calcUC1s(deltas,L,c,L_I,grid);
        UC2s_of_ds = calcUC2s(deltas,L,c,L_I,grid);
        Z(row,col) = abs( UC1d_of_dd - UC2d_of_dd  ) +...
                 abs( UC1s_of_ds - UC2s_of_ds  );
             
    end
    row
end

%%
figure(101)
surfc(X,Y,Z)
%plot(Y,Z)


%%
figure(102)
contour(X,Y,Z,70)


%%
del = [0;0];
calcUC1d( del, 1, 0.95, 0.25, 1000)


