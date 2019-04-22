function david(handles)
% Produce graph and highlight nodes

img = imread('sample.png');
imshow(img);
title('Campus Sample');
[x, y] = ginput();

%hold on;


% for i=1:2:length(x)
%     a = plot([x(i), x(i+1)], [y(i), y(i+1)], 'r-');
%     % set(a,'LineWidth',3);
%     hold on;
% end
% 
% % d = plot([x(1), x(2)], [y(1), y(2)], 'b-');
% % set(d, 'LineWidth', 3);
% % hold on;

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


weights = [28.52 26.31 58.45 47.31 40.36 43.56 62.41 60.01 49.04 27.64 48.13 102.56 37.42,...
    44.15 51.69 67.73 44.57 56.23 70.67 54.83 44.57 46.82 24.98 18.71 11.59 13.39 30.81 26.69 47.71 39.55 44.3,...
    8.95 5.81 19.52 16.93 18.73 17.53 23.62 12.25 7.41 20.07 22.7 22.38 17.42 13.05]; 

%disp(length(weights));
nodeTable = table(nodes,'VariableNames',{'Name'});
g = graph(s,t,weights, nodeTable,'omitselfloops');
plot(g);

startNode = findnode(G,handles.startLoc.String{handles.startLoc.Value});
endNode  = findnode(G,handles.endLoc.String{handles.endLoc.Value});


if(handles.shortBox.Value == 1)
    [path,~] = dijkstra(G,startNode,endNode);
elseif(handles.longBox.Value == 1)
    [path,~] = longestPath(G,startNode,endNode);
elseif(handles.allBox.Value == 1)
    [path,~] = nns(G,startNode,endNode);
end


imshow(img);
disp(path)
disp(G.Nodes.XCoord(path(1)))
hold on


for i = 1:length(path)-1

    plot(handles.mapAxes,[G.Nodes.XCoord(path(i)), G.Nodes.XCoord(path(i+1))],[G.Nodes.YCoord(path(i)), G.Nodes.YCoord(path(i+1))],'-or')

end
end
