clear
clc

node1 = Node('node1');
node2 = Node('node2');
node3 = Node('node3');
node4 = Node('node4');
node5 = Node('node5');


node1AdjNode = [string(node2.Name),string(node3.Name)];
node1AdjDist = [9,4];

node2AdjNode = [string(node1.Name),string(node3.Name),string(node4.Name)];
node2AdjDist = [9,2,1];

node3AdjNode = [string(node1.Name),string(node2.Name),string(node4.Name)];
node3AdjDist = [4,2,6];

node4AdjNode = [string(node2.Name),string(node3.Name)];
node4AdjDist = [1,5];

node5AdjNode = [string(node3.Name)];
node5AdjDist = [2];


node1 = node1.addAdjacent(node1AdjNode,node1AdjDist);
node2 = node2.addAdjacent(node2AdjNode,node2AdjDist);
node3 = node3.addAdjacent(node3AdjNode,node3AdjDist);
node4 = node4.addAdjacent(node4AdjNode,node4AdjDist);
node5 = node5.addAdjacent(node5AdjNode,node5AdjDist);

nodes = [node1,node2,node3,node4];

[path,finalDist] = dijkstra(nodes);
disp(path);
disp(finalDist)

%
%   --5--n3
%  /      | \5
% n1      2  n4
%   \     | /1
%    -10--n2