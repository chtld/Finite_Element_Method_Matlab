function error = compute_error_on_nodes(exactso,Pb,solution)
%COMPUTE_ERROR_ON_NODES 此处显示有关此函数的摘要
%   此处显示详细说明
for i =1:size(Pb,2)
exactsolution(i,1) = feval(exactso,Pb(:,i));
end
error=max(abs(solution-exactsolution));
end

