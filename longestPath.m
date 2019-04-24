function [path,finalDist] = longestPath(aGraph, startName, endName,handles)
    startNode = findnode(aGraph,startName);
    endNode = findnode(aGraph,endName);
    path = [];

    visited = [];
    distances = zeros(1,numnodes(aGraph));
    fromNode = zeros(1,numnodes(aGraph));

%% Initial Values
    for i = 1:length(distances)
        distances(i) = -1;
    end

    distances(startNode) = 0;

    currentNode = startNode;

%% Visiting Adjacents
    while length(visited) < numnodes(aGraph)
        tempAdjacents = neighbors(aGraph,currentNode);
        adjacents = [];
        
        % remove adjacent if visited already
        for i = 1:length(tempAdjacents)
            if ~sum(ismember(visited,tempAdjacents(i)))
                adjacents = [adjacents,tempAdjacents(i)];
            end
        end
    
        % Records distances to adjacent nodes
        for i = 1:length(adjacents)
            neighbor = adjacents(i);
            
            plot(handles.mapAxes,[aGraph.Nodes.XCoord(currentNode), aGraph.Nodes.XCoord(neighbor)],[aGraph.Nodes.YCoord(currentNode), aGraph.Nodes.YCoord(neighbor)],'-ro','LineWidth',3)
            
            weight = aGraph.Edges.Weight(findedge(aGraph,currentNode,neighbor));
            newDist = distances(currentNode) + weight;

            if distances(neighbor) < newDist
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
        if ~(nextNode == 0)
            currentNode = findnode(aGraph,nextNode);
        else
            break
        end

    end


%% Creates a readable path
    path = [path,endNode];
    finalDist = distances(endNode);
    lastNode = endNode;

    for nil = 1:length(visited)
        if lastNode
            visit = fromNode(lastNode);
        else
            visit = 0;
        end
        
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


%% Some functions I had to make cuz MATLAB doesn't have stuff I need

% Gets index of node with least distance
function i = least(nodeDist,ignore)
    sorted = fliplr(sort(nodeDist));
    
    if(ignore > 0)
        sorted(ignore) = -1;
        nodeDist(ignore) = -1;
    end
    
    i = find(nodeDist==sorted(1+ignore),1);
end
