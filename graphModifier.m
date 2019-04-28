% Function to update the weight scaling on the graph
function newGraph = graphModifier(G, buildings, loveBuilding)
    nodes = table2cell(G.Nodes);

    for i = 1:length(nodes)
        node = nodes(i,1);
        nodeID = findnode(G,node);

        if sum(ismember(buildings,node))
            edges = outedges(G,nodes(i,1));

            % How much the user wants to travel through buildings
            % determines the multiplier that each weight is multiplied by
            for j = 1:length(edges)
                G.Edges.Weight(edges(j)) = G.Edges.Weight(j)*loveBuilding; 
            end
        end
    end

    newGraph = G;

    
end
