% ���ط��Ź�����
syms S k_s k_o k_p k_f x

% �������Ϊ���ű���
% S = sym(1000); % �����
% k_s = sym(10); % �洢��ÿƽ���׳ɱ�ϵ��
% k_o = sym(5);  % �洢�������ɱ�ϵ��
% k_p = sym(8);  % ǰ����ÿƽ���׳ɱ�ϵ��
% k_f = sym(6);  % ǰ������ѡ�ɱ�ϵ��
S = input('����������� S: ');
k_s = input('������洢��ÿƽ���׳ɱ�ϵ�� k_s: ');
k_o = input('������洢�������ɱ�ϵ�� k_o: ');
k_p = input('������ǰ����ÿƽ���׳ɱ�ϵ�� k_p: ');
k_f = input('������ǰ������ѡ�ɱ�ϵ�� k_f: ');

% ����������ܳɱ�����
C = (k_s * (x * S)^2 + k_o * x * S) + (k_p * ((1 - x) * S)^2 + k_f * (1 - x) * S);

% ������Ѱ����Сֵ
dC = diff(C, x);
x_opt = solve(dC == 0, x);

% ������С�ܳɱ�
C_min = subs(C, x, x_opt);

% ������
disp('����������� x:');
disp(double(x_opt));
disp('��С�ܳɱ� C(x):');
disp(double(C_min));

% ��ͼ
fplot(matlabFunction(C), [0, 1], 'LineWidth', 2);
hold on;
plot(double(x_opt), double(C_min), 'ro', 'MarkerSize', 10, 'LineWidth', 2);
xlabel('�洢��������� x');
ylabel('�ܳɱ� C(x)');
title('�ܳɱ���洢����������仯');
grid on;
