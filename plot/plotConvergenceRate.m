function plotConvergenceRate(grid_sizes, errors)
% 计算收敛阶
convergence_order = zeros(size(errors));
for i = 2:length(errors)
    convergence_order(i) = log(errors(i-1) / errors(i)) / log(grid_sizes(i-1) / grid_sizes(i));
end

% 绘制误差和网格尺寸的对数图
% 创建图表
loglog(grid_sizes, errors, '-o', 'LineWidth', 2, 'MarkerSize', 8);
xlabel('Mesh size', 'FontSize', 14);
ylabel('Error', 'FontSize', 14);
title('Convergence', 'FontSize', 16);
grid on;
set(gca, 'FontSize', 12);
% 输出收敛阶
% disp('收敛阶：');
% disp(convergence_order);
end