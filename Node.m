classdef Node
    properties
        Name % String
        AdjacentNodes % Array of Nodes
        AdjacentDistances % $Array of Ints (can't put different data types in array so gotta have two arrays :( )
        Coord % Array of Array of Ints
        Building % Boolean
    end

    methods
        % Initializes the class
        function obj = Node(name,coord,building)
            if nargin < 3
                obj.Building = 0;
            else
                obj.Building = building;
            end

            obj.Name = name;
            obj.Coord = coord;
            obj.AdjacentNodes = [];
            obj.AdjacentDistances = [];
        end

        % Adds nodes to Adjacents
        function obj = addAdjacent(obj,nodes,distances)
            obj.AdjacentNodes = [obj.AdjacentNodes,nodes];
            obj.AdjacentDistances = [obj.AdjacentDistances,distances];
        end
    end
end
