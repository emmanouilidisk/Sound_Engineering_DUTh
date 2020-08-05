function SNR = find_SNR(Y,x)
%
% Function for finding SNR of a given signal
% 
% Parameters:
% Y: reconstructed signal
% x: initial audio signal
%
% Returns: the value of SNR

y = frame_recon(Y,0.5);
dim_y = size(y);

% Find SNR
y = y.';
x_without_last_column = x(1:dim_y(2),1);
SNR = 10 * log10( sum(x_without_last_column.^2) ./ sum((x_without_last_column-y).^2) );
end

