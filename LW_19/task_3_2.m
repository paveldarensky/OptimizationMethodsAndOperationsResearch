% область определения и шаг
a = 2;
b = 4;
h = 0.1;

% Вектор значений x в заданном диапазоне с шагом h (массив иксов)
x = a:h:b;
% Вычисление значений функции f(x) для каждого x
f = x.^3 - 7*x.^2 + 14*x - 8;

% Построение графика функции
figure;
plot(x, f, '-k.', 'LineWidth', 1.5, 'MarkerSize', 15)
grid on
xlabel('x')
ylabel('f(x)')
title('$$f(x) = x^3 - 7x^2 + 14x - 8$$', 'Interpreter', 'latex')

% Нахождение всех минимальных и максимальных значений
minValue = min(f); % Минимальное значение функции
maxValue = max(f); % Максимальное значение функции

% Индексы всех точек с минимальными и максимальными значениями
minIndices = find(f == minValue);
maxIndices = find(f == maxValue);

% Добавление маркеров и подписей для всех минимумов
hold on
for i = 1:length(minIndices)
    xMin = x(minIndices(i));
    plot(xMin, minValue, 'rv', 'MarkerSize', 10, 'MarkerFaceColor', 'red') % Точка минимума
    text(xMin, minValue, 'Минимум', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'right', 'Color', 'red')
end

% Добавление маркеров и подписей для всех максимумов
for i = 1:length(maxIndices)
    xMax = x(maxIndices(i));
    plot(xMax, maxValue, 'b^', 'MarkerSize', 10, 'MarkerFaceColor', 'blue') % Точка максимума
    text(xMax, maxValue, 'Максимум', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'Color', 'blue')
end

hold off
