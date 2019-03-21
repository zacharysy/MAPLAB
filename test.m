clear
clc

s = [1 1 2 2 3 ];
t = [2 3 3 4 4 ];
weights = [10 5 2 1 5];
nodeNames = {'N1' 'N2' 'N3' 'N4'};
G = graph(s,t,weights,nodeNames);

plot(G,'EdgeLabel',G.Edges.Weight)
%[a, b] = nns(nodes, node2);
%disp(a);
%disp(b);
[path,dist] = dijkstra(G,'N4','N1')
[p, d] = nns(G, 'N1', 'N4')

%
%   --5--n3
%  /      | \5
% n1      2  n4
%   \     | /1
%    -10--n2
