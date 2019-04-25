class LocationsController < ApplicationController

def index
  if params[:q].blank?
    @coordinates = 'Please enter a query'
    return
  end

  search = LocationiqApi.new('pk.d905eb6bf7b095ff4b883766bb357766').find_place(params[:q])

  # Hash#dig will return nil if ANY part of the lookup fails
  latitude = search.dig('searchresults', 'place', 'lat')
  longitude = search.dig('searchresults', 'place', 'lon')

  if latitude.nil? || longitude.nil?
    # Output an error message if lat or lon is nil
    @coordinates = 'No search results'
  else
    @coordinates = "#{latitude}, #{longitude}"
  end
end
  
end




