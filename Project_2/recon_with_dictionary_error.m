function Y = recon_with_dictionary_error(X,N,error_dictionary,a,G)
%
% Function that reconstructs the audio signal with the
% dictionary of errors
% 
% Parameters:
% X: audio signal in frames
% N: number of elements of dictionary
% error_dictionary: dictionary with errors
% a: LPC coefficients
% G: gain of each frame
%
% Returns: the reconstructed signal

dim_X = size(X);
decoded = zeros(dim_X(1),dim_X(2));
mean_square_error = zeros(1,N);
e_new = zeros(dim_X(1),dim_X(2));
Y = zeros(dim_X(1),dim_X(2));

for t=1:dim_X(2)
    for i=1:N
        decoded(:,i) = filter(G(t), a(:,t), error_dictionary(:,i));
        mean_square_error(i) = (1/N) * sum((decoded(:,i)-X(:,t)).^2);
    end
    [min_value,index] = min(mean_square_error);
    e_new(:,t) = error_dictionary(:,index);
    Y(:,t) = filter(G(t),a(:,t), e_new(:,t));  
end

end

