%{
%3
function main()
    f = @(x) (1.5 - x(1) + x(1)*x(2))^2 + ...
             (2.25 - x(1) + x(1)*x(2)^2)^2 + ...
             (2.625 - x(1) + x(1)*x(2)^3)^2;
    x0 = [0; 0];
    A = [1, -2];
    b = 3;
    options = optimoptions('fmincon', 'Algorithm', 'sqp');
    [x_min, f_min] = fmincon(f, x0, A, b, [], [], [], [], @nonlin_constraints, options);
    fprintf('Минимум функции Била с ограничениями:\n');
    fprintf('x1 = %.4f, x2 = %.4f\n', x_min(1), x_min(2));
    fprintf('Значение функции: f(x_min) = %.4f\n', f_min);
end

function [c, ceq] = nonlin_constraints(x)
    c = [3*x(1)^2 + 2*x(2)^3 - 55;  % 3 * x1^2 + 2 * x2^3 <= 55
         33 - (x(1)^3 + x(2)^2);    % x1^3 + x2^2 >= 33 -> 33 - (x1^3 + x2^2) <= 0
         x(1) - 2*x(2) - 3];        % x1 - 2 * x2 <= 3
    ceq = [];
end
%}

%{
%4.1
function main()
    f = @(x) (1.5 - x(1) + x(1)*x(2))^2 + ...
         (2.25 - x(1) + x(1)*x(2)^2)^2 + ...
         (2.625 - x(1) + x(1)*x(2)^3)^2;

    x0 = [0; 0];

    A = [1, -2];
    b = 3;

    options = optimoptions('patternsearch', 'Display', 'iter');

    [x_min, f_min] = patternsearch(f, x0, A, b, [], [], [], [], @nonlin_constraints, options);

    fprintf('Минимум функции Била с ограничениями (patternsearch):\n');
    fprintf('x1 = %.4f, x2 = %.4f\n', x_min(1), x_min(2));
    fprintf('Значение функции: f(x_min) = %.4f\n', f_min);
end

function [c, ceq] = nonlin_constraints(x)
    c = [3*x(1)^2 + 2*x(2)^3 - 55; 
         33 - (x(1)^3 + x(2)^2);
         x(1) - 2*x(2) - 3];   
    ceq = [];
end
%}

%4.2
function main()
    f = @(x) (1.5 - x(1) + x(1)*x(2))^2 + ...
         (2.25 - x(1) + x(1)*x(2)^2)^2 + ...
         (2.625 - x(1) + x(1)*x(2)^3)^2;

    x0 = [0; 0];

    A = [1, -2];
    b = 3;
    
    lb = [-4.5, -4.5];  
    ub = [4.5, 4.5];

    options = optimoptions('ga', 'Display', 'iter', 'ConstraintTolerance', 1e-6);

    [x_min, f_min] = ga(f, 2, A, b, [], [], lb, ub, @nonlin_constraints, options);

    fprintf('Минимум функции Била с ограничениями (ga):\n');
    fprintf('x1 = %.4f, x2 = %.4f\n', x_min(1), x_min(2));
    fprintf('Значение функции: f(x_min) = %.4f\n', f_min);
end

function [c, ceq] = nonlin_constraints(x)
    c = [3*x(1)^2 + 2*x(2)^3 - 55; 
         33 - (x(1)^3 + x(2)^2);
         x(1) - 2*x(2) - 3];   
    ceq = [];
end

