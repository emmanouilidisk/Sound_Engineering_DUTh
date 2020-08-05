function noise = determine_noise(technique,X,measure,E,max_energy)   
%
% The function computes the noise of the given signal 
% for the selected technique.
%
% Parameters:
% technique: 2,3,4 for technique 2,3,4 of the exercise
% X: matrix with frames of initial signal
% measure: matrix with measure of FFT for all frames
% E: matrix with energy of each frame
% max_energy: maximum energy over all frames
%
% Returns: 
% the estimated noise according to the selected technique

dim_E = size(E);

if technique == 2 || technique == 4
    % Determine noise with technique 2
    % or initial noise for technique 4
    index = 1;
    while(index < dim_E(2))
        if(E(index) < 0.01 * max_energy)
            break
        end
    end
    noise = measure(:,index);
    
elseif technique == 3
    % Determine noise with technique 3
    %Initialize variables
    summation = zeros(dim_E(1),1);
    counter = 0; %counter of frames with small energy
    for i=1:dim_E(2)
        if(E(i) < 0.01*max_energy)
           summation = summation + measure(:,i);
           counter = counter + 1;
        end
    end
    %Compute mean value
    mean_value = summation ./ counter;
    noise = mean_value;
else
        disp('Wrong technique.Technique must be 2,3 or 4');
        noise = 0;
end
    