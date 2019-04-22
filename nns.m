function [path, distanceHist] = nns(Graph, start, destination)

%%   Initialize start, end, and current nodes
    startNode = findnode(Graph, start);
    destNode = findnode(Graph, destination);
    currentNode = startNode;

%%   Initialize path and distances arrays
    distanceHist = zeros(1, length(numnodes(Graph)));
    
    path = [currentNode];
    visited = [currentNode];
    nextNode = 0;
    
%%   Continue until the final node is reached
    while currentNode ~= destNode
        adjacents = neighbors(Graph, currentNode);
        weights = zeros(1, length(neighbors(Graph, currentNode)));
        
        for i=1:length(adjacents)
            neighbor = adjacents(i);
            % As long as the neighbor isn't visited, update the weight
            % array
            if (~(sum(ismember(visited, neighbor))))
                weights(i) = Graph.Edges.Weight(findedge(Graph, currentNode, neighbor));  
            else
            % Otherwise, that neighbor is weighted such that it will not be
            % visited anymore
                weights(i) = inf;
            end
        end
        
        leastEdgeIndex = find(weights == min(weights));
        nextNode = findnode(Graph, adjacents(leastEdgeIndex));
        distanceHist = [distanceHist, weights(leastEdgeIndex)];
        
        % Update the current node and path
        currentNode = nextNode;
        path = [path, currentNode];
        visited = [visited, currentNode];
        nextNode = 0;

    end       
end