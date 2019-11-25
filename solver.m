

%%
ti = 0  ; % start time
tf = 50 ;% end time

% [delta_d, delta_s] vector
delta_ini = [ 0.01, 0.01]; % initial conditions

%options = odeset('RelTol',1e-2,'AbsTol',[1e-4 1e-4]);
[t,x] = ode45('delta_diffeq',[ti,tf],delta_ini); % calling ode solver

% figure(1)
% hold on
% plot(x(:,1),x(:,2),'o') % plot x,z
figure(2)
hold on
plot(t,x(:,1),'--')
hold on
plot(t,x(:,2))
xlabel('Time ')
ylabel('\delta_d, \delta_s')
hold off

title('\delta_d and \delta_s after perturbation')




