
noise_vector = (pi/4);
num_times = 10;              % Run for noise

% code for m memorised patterns
m = 2;                      % Two patterns 0 and 1 
keys = zeros(n, m);

keys(:,1) = make('zero.txt');
keys(:,2) = make('one.txt');
%keys(:,3) = make('two.txt');
%keys(:,4) = make('three.txt');

s_hebbian = make_Hebbian(keys, n);

% network parameters for recognition
Ttimes = 20;                % number of times pattern is displayed
T_here = T*Ttimes;

for noise = noise_vector
  max_accuracy = [];        % initialise max_accuracy for the coming num_times runs for a given noise
                            
  for j = 1:num_times
    phi_noisy = mod(phi + randn(n,1)*noise, 2*pi);
    phi_here = phi_noisy;
    perror_vec = [];        % initialise percentage error vector for this run - error reduces along the run
                            
    for i = 0:dt:T_here
      [phi_here] = phi_change(phi_here, s_hebbian, n, dtau); % phase change by one long time step    
                                   
      disp_option = mod(i, T_here/Ttimes);   % Display iterations
                                   
      [dispvec_here] = display_phi (phi_here, r, c, disp_option); % display pattern and generate relative phase vector
                                   
                                   
      perror_vec = [perror_vec, norm(dispvec_here - dispvec_one)/norm(dispvec_one)*100];
      if disp_option == 0

         figure(2)          % recognition along this run
         plot(0:dt:i, 100 - perror_vec)
         xlabel("Time of run");
         ylabel("% Accuracy");
         title("Last run");
         pause(0.1)
      end
    end
    figure(3)                 % recognition for different num_times*noise
    hold on
    plot(0:dt:T_here, 100 - perror_vec)
    xlabel("Time of run");
    ylabel("% Accuracy");
    title("All run");
    
    max_this = max(100 - perror_vec);
    max_accuracy = [max_accuracy, max_this];
  end

  figure(4)                   % figure for scatter plot
  hold on
  scatter(max_accuracy, max_accuracy, 10)
  avg_max = mean(max_accuracy);
  scatter(avg_max, avg_max, 200)
  xlabel("Max Accuracy");
  ylabel("Max Accuracy");
end