function error_dictionary = find_error_dictionary(N,X,e)
%
% Function that computes the dictionary with errors (used for CELP)
% 
% Parameters:
% N: number of elements of dictionary
% X: audio signal in frames
% e: error of frames
%
% Returns: the dictionary computed

dim_e = size(e);
error_dictionary = zeros(dim_e(1),N);

k = kurtosis(e);
[res,ind] = sort(k,'descend');
for i=1:N
    error_dictionary(:,i) = e(:,ind(i));
end

end