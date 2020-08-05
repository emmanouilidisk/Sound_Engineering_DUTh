function y = FBCF(input_signal,g,N)
%
% Function implementing Feed-Back Comb Filter
%
dim_sig = size(input_signal);
y = zeros(1,dim_sig(1));
for n=1:dim_sig(1)
    if(n > N)
        y(n) = input_signal(n) - g * y(n-N);
    else
        y(n) = 0;%input_signal(n);
    end
end
end
