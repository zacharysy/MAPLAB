% this has problems but will have to do for now
function newGraph = graphModifier(G, buildings, loveBuilding)
    nodes = table2cell(G.Nodes);

    for i = 1:length(nodes)
        node = nodes(i,1);
        nodeID = findnode(G,node);

        if sum(ismember(buildings,node))
            edges = outedges(G,nodes(i,1));


            for j = 1:length(edges)
                G.Edges.Weight(edges(j)) = G.Edges.Weight(j)*loveBuilding; 
            end
        end
    end

    newGraph = G;

    
end
