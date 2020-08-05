function y_out = AP(input_signal,g,N)
%
% Function implementing all pass filter
%
dim_sig = size(input_signal);
y = input_signal;
for n=1:dim_sig(2)
    if(n>N)
        y(n) = -g.*y(n-N) + g.*input_signal(n) + input_signal(n-N);
    else
        y(n) = 0; %g .* input_signal(n);
    end
end
y_out = y;
end

