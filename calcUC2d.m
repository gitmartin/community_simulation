function [ UC2d_of_dd ] = calcUC2d( deltas, L, c, L_I, grid  )

dd = deltas(1); % delta_d
ds = deltas(2); % delta_s

y = linspace(dd, L_I, grid);
x = linspace(-L_I, L_I, grid);
z = linspace(ds, L_I, grid);

P_C_of_x = [];
for xx = x;
    P_C_of_x(end+1) = trapz( y, p(xx,y,L));
end
%plot(x, P_C_of_x,'o')

integrand_evaluated_at_points = [];
for zz = z
    q_values = q(x,zz,L);
    qP = q_values.*P_C_of_x;
    
    [~, ind] = max(qP);
    x_z_star = x(ind);
    
    integrand_evaluated_at_points(end+1) =  ... q(x_0_star,utility_of_agent,L) * p(x_0_star,yy,L) ;% -...       % producing
        p(x_z_star,dd,L)* q(x_z_star,zz,L) ;  % consuming
end

UC2d_of_dd = trapz(z,integrand_evaluated_at_points) - c*(L_I-ds); % trapezoidal integration

end

