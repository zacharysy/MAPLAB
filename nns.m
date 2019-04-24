function [path, distanceHist] = nns(Graph, start, destination, handles)

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
        
        if(~leastEdgeIndex)
            break
        end
            
        nextNode = findnode(Graph, adjacents(leastEdgeIndex));
        distanceHist = [distanceHist, weights(leastEdgeIndex)];
        
        if(length(nextNode)>1)
            i = 1;
            nextNode = nextNode(i);
            while(currentNode == nextNode)
                nextNode = nextNode(i);
                i=i+1;
            end
        end
        
        % Update the current node and path
        currentNode = nextNode;
        path = [path, currentNode];
        visited = [visited, currentNode];
        nextNode = 0;

    end       
end