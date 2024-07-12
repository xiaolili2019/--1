% 加载符号工具箱
syms S k_s k_o k_p k_f x

% 定义参数为符号变量
% S = sym(1000); % 总面积
% k_s = sym(10); % 存储区每平方米成本系数
% k_o = sym(5);  % 存储区操作成本系数
% k_p = sym(8);  % 前置区每平方米成本系数
% k_f = sym(6);  % 前置区拣选成本系数
S = input('请输入总面积 S: ');
k_s = input('请输入存储区每平方米成本系数 k_s: ');
k_o = input('请输入存储区操作成本系数 k_o: ');
k_p = input('请输入前置区每平方米成本系数 k_p: ');
k_f = input('请输入前置区拣选成本系数 k_f: ');

% 定义非线性总成本函数
C = (k_s * (x * S)^2 + k_o * x * S) + (k_p * ((1 - x) * S)^2 + k_f * (1 - x) * S);

% 求导数并寻找最小值
dC = diff(C, x);
x_opt = solve(dC == 0, x);

% 计算最小总成本
C_min = subs(C, x, x_opt);

% 输出结果
disp('最优面积比例 x:');
disp(double(x_opt));
disp('最小总成本 C(x):');
disp(double(C_min));

% 绘图
fplot(matlabFunction(C), [0, 1], 'LineWidth', 2);
hold on;
plot(double(x_opt), double(C_min), 'ro', 'MarkerSize', 10, 'LineWidth', 2);
xlabel('存储区面积比例 x');
ylabel('总成本 C(x)');
title('总成本随存储区面积比例变化');
grid on;
