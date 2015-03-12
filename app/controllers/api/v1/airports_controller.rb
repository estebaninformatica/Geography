class Api::V1::AirportsController < ApplicationController

  def index
    @airports = Airport.search(params[:criteria]).limit(params[:limit]).offset(params[:offset])

    airports_hash = @airports.map do |airport|
      airport.to_json_middle
    end

    render json: airports_hash
  end

  def show
    @airport = Airport.find(params[:id])
    render json: @airport.to_json_middle
  end

end
