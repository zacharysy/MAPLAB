% Produce graph and highlight nodes

clear
clc

img = imread('sample.png');
% imshow(img);
% title('Campus Sample');
% [x, y] = ginput();
% 
% hold on;

% 
% for i=1:2:length(x)
%     a = plot([x(i), x(i+1)], [y(i), y(i+1)], 'r-');
%     set(a,'LineWidth',3);
%     hold on;
% end
% 
% d = plot([x(1), x(2)], [y(1), y(2)], 'b-');
% set(d, 'LineWidth', 3);
% hold on;

x = [184.9073
  244.3567
  342.5774
  478.2770
  244.3567
  359.3783
  529.9721
  616.5614
  183.6149
  188.7844
  439.5057
  620.4386
  526.0950
  434.3362
  285.7127
  358.0859
  386.5182
  367.1325
  430.4590
  327.0688
  316.7298
  279.2509
  265.0347
  520.9255
  474.3999
  412.3658
  434.3362];

y = [315.5171
  131.9994
  120.3680
  144.9232
  368.5046
  364.6274
  354.2884
  236.6820
  257.3601
  369.7969
  360.7503
  350.4113
  241.8515
  245.7287
  250.8982
  200.4954
  178.5250
  151.3851
  147.5080
  151.3851
  175.9403
  155.2622
  146.2156
  144.9232
  244.4363
  248.3134
  256.0677];
%% Make Graph

buildings = {'Rockne Memorial', 'Lyons Hall', 'Morissey Hall', 'Howard Hall', 'Pangborn Hall', 'Fisher Hall', 'South Dining Hall', 'Badin Hall'}';
intersections = {};
for i=1:19
    intersections{i} = ['i', num2str(i)];
end

nodes = cat(1, buildings, intersections');
xVal = x;
yVal = y;
disp(length(x))
bump = length(buildings);
s = [1 1 1 bump+7 bump+7 bump+7 bump+7 bump+7 bump+7 5 5 5 6 bump+3 bump+3 7 7 7 7 bump+4 8,...
    bump+5 bump+5 bump+16 bump+17 bump+11 bump+11 bump+11 bump+11 bump+6 bump+6 bump+6 bump+6,...
    bump+10 bump+10 bump+10 3 bump+12 bump+12 bump+14 bump+14 bump+14 bump+13 bump+9 bump+15];

t = [bump+1 bump+2 bump+7 bump+14 bump+13 bump+8 bump+18 5 bump+1 bump+2 6 ,...
    bump+18 bump+3 bump+19 7 bump+19 bump+4 8 bump+5 8 bump+5 bump+16 bump+17 4 4,...
    4 bump+10 bump+9 bump+6 bump+9 bump+8 bump+18 bump+19 3 bump+9 bump+12 bump+12,...
    bump+14 bump+13 bump+15 2 bump+13 bump+8 bump+8 2];


weights = [28.52 26.31 58.45 47.31 40.36 43.56 62.41 60.01 49.04 27.64 48.13 102.56 37.42,...
    44.15 51.69 67.73 44.57 56.23 70.67 54.83 44.57 46.82 24.98 18.71 11.59 13.39 30.81 26.69 47.71 39.55 44.3,...
    8.95 5.81 19.52 16.93 18.73 17.53 23.62 12.25 7.41 20.07 22.7 22.38 17.42 13.05]; 

nodeTable = table(nodes,xVal,yVal,'VariableNames',{'Name','XCoord','YCoord'});
g = graph(s,t,weights, nodeTable,'omitselfloops');
plot(g);


