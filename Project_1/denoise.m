function denoised_measure = denoise(technique,X,measure,E,max_energy,noise)   
%
% The function denoises the measure of FFT subtracting the input noise.
%
% Parameters:
% technique: 2,3,4 for technique 2,3,4 of the exercise
% X: matrix with frames of initial signal
% measure: matrix with measure of FFT for all frames
% E: matrix with energy of each frame
% max_energy: maximum energy over all frames
% noise: the noise to be removed
%
% Returns: 
% the denoised measure of FFT according to the selected technique

dim_measure = size(measure);
denoised_measure = zeros(dim_measure(1),dim_measure(2));

if technique == 2 || technique == 3
    %For techniques 2 and 3 just subtract the noise from measure
    denoised_measure = max(0, measure - noise);
    
elseif technique == 4
    %For technique 4 we get as input parameter the noise computed from technique 2
    %In this function we just update the noise for frames with small energy
    
    for j=1:dim_measure(2)
        denoised_measure(:,j) = max(0, measure(:,j) - noise);
        if(E(j) < 0.01*max_energy)
            %Update noise
            noise = zeros(1,dim_measure(1));
            noise = X(:,j);
        end
    end
else
    disp('Wrong technique.Technique must be 2,3 or 4');
end
    