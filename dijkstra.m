function [path,finalDist] = dijkstra(aGraph, startName)
    startNode = findnode(aGraph,startName);

    lol = 0;


    visited = [];
    distances = zeros(1,numnodes(aGraph));
    fromNode = [];

%% Initial Values
    for i = 1:length(distances)
        distances(i) = inf;
    end

    distances(startNode) = 0;

    currentNode = startNode;

%% Visiting Adjacents
    while length(visited) < numnodes(aGraph)-1
        adjacents = neighbors(aGraph,currentNode);
    
        % Records distances to adjacent nodes
        for i = 1:length(adjacents)
            neighbor = adjacents(i);
            weight = aGraph.Edges.Weight(findedge(aGraph,currentNode,neighbor));
            newDist = distances(currentNode) + weight;

            if distances(neighbor) > newDist
                distances(neighbor) = newDist;
            end
        end

        visited = [visited,currentNode];

%% Finding Next Node with Least Distance
        count = 0;
        nextNode = least(distances,count);
        [bool,~] = nodeInArray(visited,findnode(aGraph,nextNode));

        % repeats until an univisited node with least distance is found
        while bool
            count = count + 1;
            nextNode = least(distances,count);
            [bool,~] = nodeInArray(visited,findnode(aGraph,nextNode));
        end

%% Update current node! yay.

        fromNode(nextNode) = currentNode;
        currentNode = findnode(aGraph,nextNode);

    end


%% Done
    path = fromNode;
    finalDist = distances;
end


%% Some functions I had to make cuz MATLAB doesn't have shit I need

% Gets index of node with least distance
function i = least(nodeDist,ignore)
    sorted = sort(nodeDist);
    i = find(nodeDist==sorted(1+ignore),1);
end

% Finds if node with name 'node' is in an array
function [bool,index] = nodeInArray(arr,node)
    bool = 0;
    index = inf;

    for i = 1:length(arr)
        if arr(i) == node
            bool = 1;
            index = i;
        end
    end

end
