function [out_A,out_B] = reverb_schroeder(x,type, mix)
%
% Function that implements reverb schroeder 
%

if(type == 1)
    % 4 FBCF filters parallel
    FBCF_1 = FBCF(x,0.805,901);
    FBCF_2 = FBCF(x,0.827,778); 
    FBCF_3 = FBCF(x,0.783,1011); 
    FBCF_4 = FBCF(x,0.764,1123); 
    
    % Addition of results from FBCF
    FBCF_total = FBCF_1 + FBCF_2 + FBCF_3 + FBCF_4;
    
    % AP FIlters
    AP_1 = AP(FBCF_total,0.7, 125);
    AP_2 = AP(AP_1,0.7, 42);
    AP_3 = AP(AP_2,0.7, 12);
    
    % Outputs
    out_A = mix .* AP_3 + (1-mix) .* x';
    out_B = -mix .* AP_3 + (1-mix) .* x';
    
elseif(type == 2)
    % AP FIlters
    AP_1 = AP(x,0.7, 1051);
    AP_2 = AP(AP_1,0.7, 337);
    AP_3 = AP(AP_2,0.7, 113);

    % 4 FBCF filters parallel
    FFCF_1 = FFCF(AP_3,0.742,4799); 
    FFCF_2 = FFCF(AP_3,0.733,4999); 
    FFCF_3 = FFCF(AP_3,0.715,5399); 
    FFCF_4 = FFCF(AP_3,0.697,5801); 
    % Addition of results from FBCF
    FFCF_total = FFCF_1 + FFCF_2 + FFCF_3 + FFCF_4
    
    % Outputs
    out_A = mix .* FFCF_total' + (1-mix) .* x;
    out_B = - mix .* FFCF_total' + (1-mix) .* x;
else
    disp("Parameter type must be either 1 or 2");
end

end

