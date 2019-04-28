
class LocationiqApi
  include HTTParty
  BASE_URI = "https://eu1.locationiq.com/v1/search.php"

  def initialize(api_key, limit = "1")
    @options = { key: api_key, limit: limit }
  end

  def find_place(street)
    self.class.get(BASE_URI, query: @options.merge({ q: street }))
  end 

  def handle_error
    if find_place.code.to_i = 200
      find_place.parsed_response
    else
      raise "Couldn't connect to LocationIQ Api"
    end
  end
end