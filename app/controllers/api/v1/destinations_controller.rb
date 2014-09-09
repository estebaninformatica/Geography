class Api::V1::DestinationsController < ApplicationController

  def index
    @destinations = Destination.limit(params[:limit]).offset(params[:offset])
    render json: @destinations.to_json(:include => :area, methods: :url)
  end

  def show
    @destination = Destination.find(params[:id])
    render json: @destination.to_json(:include => :area, methods: :url)
  end


end
