class LocationsController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:q].blank?
      @message = 'Please enter an address in the field!'
      return
    end
  
    search = LocationiqApi.new('pk.d905eb6bf7b095ff4b883766bb357766').find_place(params[:q])

    # Hash#dig will return nil if ANY part of the lookup fails
    latitude = search.dig('searchresults', 'place', 'lat')
    longitude = search.dig('searchresults', 'place', 'lon')

    if latitude.nil? || longitude.nil?
      # Output an error message if lat or lon is nil
      @coordinates = "We couldn't find a place by this name. Please enter a valid place name."
    else
      @coordinates = "Coordinates: " + "#{latitude}, #{longitude}"
    end
  end
end




