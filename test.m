clear
clc

s = [1 1 2 2 3 ];
t = [2 3 3 4 4 ];
weights = [10 5 2 1 5];
nodeNames = {'N1' 'LaFun' 'N3' 'Hesburgh'};
buildings = {'LaFun','Hesburgh'};
%buildings = cell2table(buildings)
G = graph(s,t,weights,nodeNames);


plot(G,'EdgeLabel',G.Edges.Weight)
%[a, b] = nns(nodes, node2);
%disp(a);
%disp(b);

% [path,dist] = dijkstra(G,'N4','N1')

[path,dist] = longestPath(G,'N1','Hesburgh')
[p, d] = nns(G, 'N1', 'Hesburgh')
G = graphModifier(G,buildings,1/12);
figure
plot(G,'EdgeLabel',G.Edges.Weight)
[path,dist] = dijkstra(G,'N1','Hesburgh');
[p, d] = nns(G, 'N1', 'Hesburgh');

%
%   --5--n3
%  /      | \5
% n1      2  n4
%   \     | /1
%    -10--n2
