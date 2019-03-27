function [path,finalDist] = dijkstra(aGraph, startName, endName)
    startNode = findnode(aGraph,startName);
    endNode = findnode(aGraph,endName);
    path = [];

    visited = [];
    distances = zeros(1,numnodes(aGraph));
    fromNode = zeros(1,numnodes(aGraph));

%% Initial Values
    for i = 1:length(distances)
        distances(i) = inf;
    end

    distances(startNode) = 0;

    currentNode = startNode;

%% Visiting Adjacents
    while length(visited) < numnodes(aGraph)
        adjacents = neighbors(aGraph,currentNode);
    
        % Records distances to adjacent nodes
        for i = 1:length(adjacents)
            neighbor = adjacents(i);
            weight = aGraph.Edges.Weight(findedge(aGraph,currentNode,neighbor));
            newDist = distances(currentNode) + weight;

            if distances(neighbor) > newDist
                distances(neighbor) = newDist;
                fromNode(neighbor) = currentNode;
            end
        end

        visited = [visited,currentNode];

%% Finding Next Node with Least Distance
        count = 0;
        nextNode = least(distances,count);
        bool = sum(ismember(visited,findnode(aGraph,nextNode)));

        % repeats until an univisited node with least distance is found
        while bool && ~(length(visited)==numnodes(aGraph))
            count = count + 1;
            nextNode = least(distances,count);
            bool = sum(ismember(visited,findnode(aGraph,nextNode)));
        end

%% Update current node! yay.
        currentNode = findnode(aGraph,nextNode);

    end


%% Creates a readable path
    path = [path,endNode];
    finalDist = [distances(endNode)];
    lastNode = endNode;

    while lastNode > 0
        visit = fromNode(lastNode);

        if visit
            path = [path,visit];
            finalDist = [finalDist,distances(visit)];
        end

        lastNode = visit;
    end
    
%% Done
    path = fliplr(path);
    finalDist = fliplr(finalDist);
end


%% Some functions I had to make cuz MATLAB doesn't have shit I need

% Gets index of node with least distance
function i = least(nodeDist,ignore)
    sorted = sort(nodeDist);
    i = find(nodeDist==sorted(1+ignore),1);
end
