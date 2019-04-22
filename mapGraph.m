% Produce graph and highlight nodes

clear
clc


% imshow(img);
% title('Campus Sample');
% [x, y] = ginput();
% 
% hold on;
% 
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

%% Make Graph

buildings = {'rockneMem', 'lyons', 'morissey', 'howard', 'pangborn', 'fisher'}';
intersections = {};
for i=1:4
    intersections{i} = ['i', num2str(i)];
end

nodes = cat(1, buildings, intersections');
xVal = zeros(10,1);
yVal = zeros(10,1);
bump = length(buildings);
s = [1 1 1 2 7];
t = [bump+1 8 9 10 8];
weights = [1000 200 33 40 33];


nodeTable = table(nodes,xVal,yVal,'VariableNames',{'Name','XCoord','YCoord'});
g = graph(s,t,weights,nodeTable,'omitselfloops');
plot(g);


