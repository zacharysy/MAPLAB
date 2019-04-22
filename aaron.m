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

buildings = {'Rockne Memorial', 'Lyons Hall', 'Morissey Hall', 'Howard Hall', 'Pangborn Hall', 'Fisher Hall', 'South Dining Hall', 'Badin Hall'}';
intersections = {};
for i=1:20
    intersections{i} = ['i', num2str(i)];
end

nodes = cat(1, buildings, intersections');
xVal = zeros(10,1);
yVal = zeros(10,1);
bump = length(buildings);
s = [1 1 1 bump+7 bump+7 bump+7 bump+7 bump+7 bump+7 5 5 5 6 bump+3 bump+3 7 7 7 7 bump+4 8,...
    bump+5 bump+5 bump+16 bump+17 bump+11 bump+11 bump+11 bump+11 bump+6 bump+6 bump+6 bump+6,...
    bump+10 bump+10 bump+10 3 bump+12 bump+12 bump+14 bump+14 bump+14 bump+13 bump+9 bump+15];

t = [bump+1 bump+2 bump+7 bump+14 bump+13 bump+8 bump+18 5 bump+1 bump+2 6 ,...
    bump+18 bump+3 bump+20 7 bump+20 bump+4 8 bump+5 8 bump+5 bump+16 bump+17 4 4,...
    4 bump+10 bump+9 bump+6 bump+9 bump+8 bump+18 bump+20 3 bump+9 bump+12 bump+12,...
    bump+14 bump+13 bump+15 2 bump+13 bump+8 bump+8 2];


weights = zeros(1,45); 


nodeTable = table(nodes,'VariableNames',{'Name'});
g = graph(s,t,weights, nodeTable,'omitselfloops');
plot(g);


