function y = tube_dist(x,Q, dist,gain)
%
% Function that implements tube distortion
%

% Normalization of values to [-1,1]
x_max = max(max(abs(x)));
x = x ./ x_max;
% Multiply with gain
x = gain .* x;

% Implementation of y=f(x)
dim_x = size(x);
for i=1:dim_x(1)
    if(x(i) == Q)
        if(Q ~= 0)
            y(i) = (1/dist) + (Q/(1-exp(dist*Q)));
        else
            y(i) = (1/dist);
        end
    else
        if(Q ~= 0)
            y(i) = (x(i)-Q)./(1-exp(-dist*(x(i)-Q))) + (Q/(1-exp(dist*Q)));
        else
            y(i) = (x(i)-Q)./(1-exp(-dist*(x(i)-Q)));
        end
    end
end
% Normalization of values to [-1,1]
y_max = max(max(abs(y)));
y = y ./ y_max;
end

