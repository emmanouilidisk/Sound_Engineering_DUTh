function [y_L,y_R] = rotary(x,M1, M2, depth1,depth2, f1, f2, fs) 
%
% Function that implements rotary effect
%

%Variables declaration
dim_x = size(x);
y_L = x;%zeros(1,dim_x(1));
y_R = x;%zeros(1,dim_x(1));

mat_11 = x%zeros(1,dim_x(1));%x;
mat_12 = x%zeros(1,dim_x(1));%x;
mat_21 = x%zeros(1,dim_x(1));%x;
mat_22 = x%zeros(1,dim_x(1));%x;
M1_delay = zeros(1,dim_x(1));
M2_delay = zeros(1,dim_x(1));

for n=1:dim_x(1)
    M1_delay(n) = round(M1 + depth1 * sin(2*pi*f1*n/fs));%round(find_delay(n,M1,depth1,f1,fs));
    M2_delay(n) = round(M2 + depth2 * sin(2*pi*f2*n/fs));%round(find_delay(n,M2,depth2,f2,fs));
end

for n=M1+depth1:dim_x(1)
    %compute the part of the solution that has M1 delay
    mat_11(n) = x(n-M1_delay(n)) .* (1-sin(2*pi*f1*n));
    mat_12(n) = 0.7 .* x(n - M1_delay(n)) .* (1-sin(2*pi*f1*n));
end

for n=M2+depth2:dim_x(1)
    %compute the part of the solution that has M2 delay
    mat_21(n) = 0.7 .* x(n-M2_delay(n)) .* (1+sin(2*pi*f2*n));
    mat_22(n) = x(n-M2_delay(n)) .* (1+sin(2*pi*f2*n));
end

%Combine results to take the final signal
y_L = mat_11 + mat_21;
y_R = mat_12 + mat_22;
end

function delay = find_delay(n,M,depth,f,fs)
% Function that computes the delay 
    delay = M + depth * sin(2*pi*f*n/fs);
end
