function [phi_new] = phi_change(phi_old, s, n, h)

New_sum = zeros(n,1);

% generate the derivative term from the differential equation

for i = 1:n
    New_sum(i) = sum(s(i,:)'.*sin(phi_old - phi_old(i)));
end

% first order Taylor expansion and normalisation

phi_new = phi_old + h*New_sum;
phi_new = mod(phi_new, 2*pi);