% Задание областей определения и шага
a = -5;
b = 5;
c = -5;
d = 5;
h = 0.02;

% Создание сетки значений с использованием meshgrid
[x1, x2] = meshgrid(a:h:b, c:h:d);

% Определение функции Экли
f = 20 + exp(1) - 20 * exp(-0.2 * sqrt(0.5 * (x1.^2 + x2.^2))) - exp(0.5 * (cos(2 * pi * x1) + cos(2 * pi * x2)));

% Построение 3D-графика функции
figure;
surf(x1, x2, f)
shading interp % Плавное изменение цвета
colormap bone % Установка цветовой палитры
colorbar % Отображение цветовой шкалы
xlabel('X1')
ylabel('X2')
zlabel('f(X1, X2)')
title('3D-график функции Экли с обозначением экстремумов')

% Нахождение минимального значения и его индексов
minValue = min(f(:)); % Минимальное значение функции
[rMin, cMin] = find(f == minValue); % Индексы всех минимальных значений

% Нахождение максимального значения и его индексов
maxValue = max(f(:)); % Максимальное значение функции
[rMax, cMax] = find(f == maxValue); % Индексы всех максимальных значений

% min(f(:)) и max(f(:)) вычисляют минимальное и максимальное значения во всей матрице f.
% find(f == minValue) и find(f == maxValue) возвращают индексы всех позиций в матрице f, 
% где находятся минимальные и максимальные значения. Переменные rMin, cMin, rMax, и 
% cMax содержат строковые и столбцовые индексы этих позиций.

%  заливка точки ('MarkerFaceColor', 'color').

% Подписи на графике
hold on

% Отображение всех минимумов
for i = 1:length(rMin)
    xMin = x1(rMin(i), cMin(i));
    yMin = x2(rMin(i), cMin(i));
    zMin = f(rMin(i), cMin(i));
    plot3(xMin, yMin, zMin, 'r.', 'MarkerSize', 20) % Обозначение минимума
    text(xMin, yMin, zMin, 'Минимум', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'right', 'Color', 'red')
end

% Отображение всех максимумов
for i = 1:length(rMax)
    xMax = x1(rMax(i), cMax(i));
    yMax = x2(rMax(i), cMax(i));
    zMax = f(rMax(i), cMax(i));
    plot3(xMax, yMax, zMax, 'g.', 'MarkerSize', 20) % Обозначение максимума
    text(xMax, yMax, zMax, 'Максимум', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'Color', 'green')
end

hold off
