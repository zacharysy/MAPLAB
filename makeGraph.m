nd_roads = shaperead('gis_osm_buildings_a_free_1.shp');
surveyFeetPerMeter = unitsratio('survey feet', 'meter');
for k = 1:numel(nd_roads)
    nd_roads(k).X = surveyFeetPerMeter * nd_roads(k).X;
    nd_roads(k).Y = surveyFeetPerMeter * nd_roads(k).Y;
end
