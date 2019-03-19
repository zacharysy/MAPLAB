function [path,finalDist] = dijkstra(graph)
    startNode = nodes(1);
    visited = [];
    distances = zeros(1,length(nodes));
    fromNode = strings(1,length(nodes));

%% Initial Values
    for i = 1:length(distances)
        distances(i) = inf;
    end

    for i = 1:length(nodes)
        if nodes(i).Name == startNode.Name
            distances(i) = 0;
        end
    end

    currentNode = startNode;

%% Visiting Adjacents
    while length(visited) < length(nodes)-1
        nodeDist = currentNode.AdjacentDistances;
        adjacents = currentNode.AdjacentNodes;

        % Records distances to adjacent nodes
        for i = 1:length(adjacents)
            [~,nodeIndex] = nodeInArray(nodes,currentNode.Name);
            [~,j] = nodeInArray(nodes,adjacents(i));
            [bool,~] = nodeInArray(visited,adjacents(i));

            if(distances(j)>nodeDist(i) && ~bool)
                distances(j) = distances(nodeIndex) + nodeDist(i);
            end
        end

        visited = [visited,currentNode];

%% Finding Next Node with Least Distance
        count = 0;
        i = least(distances,count);
        [bool,~] = nodeInArray(visited,nodes(i).Name);

        % repeats until an univisited node with least distance is found
        while bool
            count = count + 1;
            i = least(distances,count);
            [bool,~] = nodeInArray(visited,nodes(i).Name);
        end

%% Update current node! yay.

        fromNode(i) = currentNode.Name;
        currentNode = nodes(i);

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
        if strcmp(arr(i).Name,node)
            bool = 1;
            index = i;
        end
    end
end
