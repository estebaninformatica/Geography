class Api::V1::AptourDestinationsController < ApplicationController

  def index
    @aptourDestinations = AptourDestination.search(params[:criteria]).limit(params[:limit]).offset(params[:offset])
    render json: @aptourDestinations.to_json
  end

  def show
    @aptourDestinations = AptourDestination.find(params[:id])
    render json: @aptourDestinations.to_json
  end

end
