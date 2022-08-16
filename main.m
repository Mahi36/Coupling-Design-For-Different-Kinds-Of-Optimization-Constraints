clc
clear
close all;

r = 10;                                                       % number of rows in patterns
n = 60;                                                       % Number of oscillators
c = 6;                                                        % number of columns in patterns
T = 10;                                                       % run time
dt = T/100;                                                   % time step
t = 0:dt:T;                                                   % time vector
phi = rand(n,1)*2*pi;                                         % initial random phases
epsilon = 0.05;                                               % connectivity strength
tau = epsilon*t;                                              % long time
dtau = epsilon*dt;                                            % long time step



input_vector = make('init.txt');                              % It takes the input file generated
c_m = make_c (input_vector, n);                               % For connectivity matrix


for i = t
    [phi] = phi_change(phi, c_m, n, dtau);                    % phase change by one long time step   
                                   
    disp_option = mod(i, T/100);                              % display iterations
                                   
    [disp_init] = display_phi (phi, r, c, disp_option);       % display pattern and generate relative phase
                                   
                                   
    pause(1)  

end

load('dispvec_one.mat')
