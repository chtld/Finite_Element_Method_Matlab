function [P, T]=generate_P_T(left, right, number_of_element ) %产生矩阵P和T
P = linspace(left, right, number_of_element + 1); %产生number_of_element+1个点，存放这些点的坐标
T = [1: 1: number_of_element;   %
     2: 1: number_of_element + 1];
end