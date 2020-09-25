function [Gauss_weight, Gauss_point]=generate_gauss_formula(vertices, Gauss_type)
%GENERATE_GAUSS_FORMULA 此处显示有关此函数的摘要
%   此处显示详细说明
if Gauss_type==2
    Gauss_weight=[1 1];
    Gauss_point=[-0.5773502692 0.5773502692];
    Gauss_point=Gauss_point*(vertices(2)-vertices(1))/2+(vertices(2)+vertices(1))/2;
    Gauss_weight=Gauss_weight*(vertices(2)-vertices(1))/2;
elseif Gauss_type==3
    Gauss_weight=[0.5555555556 0.8888888889 0.5555555556];
    Gauss_point=[-0.7745966692 0 0.7745966692];
    Gauss_weight=Gauss_weight*(vertices(2)-vertices(1))/2;
    Gauss_point=Gauss_point*(vertices(2)-vertices(1))/2+(vertices(2)+vertices(1))/2;
elseif Gauss_type==4
    Gauss_point = [-0.8611363116, -0.3399810436, 0.3399810436, 0.8611363116];
    Gauss_weight = [ 0.3478548461,  0.6521451549, 0.6521451549, 0.3478548461];
    Gauss_weight=Gauss_weight*(vertices(2)-vertices(1))/2;
    Gauss_point=Gauss_point*(vertices(2)-vertices(1))/2+(vertices(2)+vertices(1))/2;
elseif Gauss_type==5
    Gauss_point = [-0.9324695142, -0.6612093865, -0.2386191761, 0.2386191761, ...
                  0.6612093865,  0.9324695142];
    Gauss_weight = [ 0.1713244924,  0.3607615730,  0.4679139346, 0.4679139346, ...
                  0.3607615730,  0.1713244924];
    Gauss_point=Gauss_point*(vertices(2)-vertices(1))/2+(vertices(2)+vertices(1))/2;
    Gauss_weight=Gauss_weight*(vertices(2)-vertices(1))/2;
else
    error('No such Gauss formula');
end
end

