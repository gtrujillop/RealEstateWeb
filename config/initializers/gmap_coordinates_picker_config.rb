GmapCoordinatesPicker.configure do |config|
  config.lat_column = :latitude
  config.lng_column = :longitude
  config.default_coordinates = [4.64, -74]
  config.map_handler = 'gMapObj' #javascript map object
  config.zoom_level = 4
  config.map_container_class = 'gmap_coordinate_picker_container'
  config.map_width = '225px'
  config.map_height = '220px'


end
