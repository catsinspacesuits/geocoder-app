class LocationsController < ApplicationController

  def index
    @search = LocationiqApi.new("pk.29313e52bff0240b650bb0573332121e").find_place(params[:q]) unless params[:q].nil?
    @latitude = @search["searchresults"]["place"]["lat"]
    @longitude = @search["searchresults"]["place"]["lon"]
    @coordinates = @latitude + ", " + @longitude  
  end

end

