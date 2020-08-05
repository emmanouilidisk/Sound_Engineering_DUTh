function y = FFCF(input_signal,g,N)
%
% Function implementing Feed-Forward Comb Filter
%
dim_sig = size(input_signal);
y = zeros(1,dim_sig(1));
for n=1:dim_sig(1)
    if(n > N)
        y(n) = g * input_signal(n) + input_signal(n-N);
    else
        y(n) = 0; %g * input_signal(n);
    end
end
end

