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

buildings = {'Alumni Hall', 'Lyons Hall', 'Fisher Hall', 'Howard Hall'}';
intersections = {};
for i=1:4
    intersections{i} = ['i', num2str(i)];
end

nodes = cat(1, buildings, intersections');
xVal = x;
yVal = y;
bump = length(buildings);
s = [1 1 2 3 3 4];
t = [bump+1 bump+2 bump+3 bump+3 bump+4 bump+3];
weights = [120 50 130 70 35 55];


nodeTable = table(nodes,xVal,yVal,'VariableNames',{'Name','XCoord','YCoord'});
G = graph(s,t,weights,nodeTable,'omitselfloops');

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
