% Produce graph and highlight nodes

clear
clc


img = imread('sample.png');
imshow(img);
title('Campus Sample');
[x, y] = ginput();

hold on;


for i=1:2:length(x)
    a = plot([x(i), x(i+1)], [y(i), y(i+1)], 'r-');
    set(a,'LineWidth',3);
    hold on;
end

d = plot([x(1), x(2)], [y(1), y(2)], 'b-');
set(d, 'LineWidth', 3);
hold on;
