clear
clc

% 1: DeBart
% 2: LaFun
% 3: Main Building
% 4: Hesburgh

s = [1 1 2 2 3 ];
t = [2 3 3 4 4 ];
weights = [10 5 2 1 5];

% Node names and their edges are not representative of their true distances
nodeNames = {'DeBart' 'LaFun' 'Main Building' 'Hesburgh'};
buildings = {'LaFun','Hesburgh'};
G = graph(s,t,weights,nodeNames);

% Plot sample graph
G = graphModifier(G,buildings,1/12);
figure
plot(G,'EdgeLabel',G.Edges.Weight);
[dijkstraPath, dijksraDist] = dijkstra(G,'DeBart','Hesburgh');
[nnsPath, nnsDist] = nns(G, 'DeBart', 'Hesburgh')


%% TODO

% Use ginput to pinpoint nodes
% Map those nodes onto a map
% Connect those nodes with edges
% 
% map = imread('');
% image(map);
% [x, y] = ginput(N);
% 


%% Test graph layout
%   --5--n3
%  /      | \5
% n1      2  n4
%   \     | /1
%    -10--n2
