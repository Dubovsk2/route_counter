module Distance_calculator
  def self.calculate_distance_through_distancematrix(departure, destination)
    departure_coordinates = Geocoder.search(departure).first.coordinates
    destination_coordinates = Geocoder.search(destination).first.coordinates
    url = "https://api.distancematrix.ai/maps/api/distancematrix/json?origins=#{departure_coordinates[0]},#{departure_coordinates[1]}&destinations=#{destination_coordinates[0]},#{destination_coordinates[1]}&key=OQwjEwSLk0fL5eyi8ZP7ifb5DnitfBSuOTtt4MzGUXzOOPlpezyrLjptqwxRDNC2"
    response = JSON.load(URI.open(url))
    response["rows"][0]["elements"][0]["distance"]["text"]
  end
end