class Api::V1::AreasController < ApplicationController

  def index
    @areas = Area.search(params[:criteria]).limit(params[:limit]).offset(params[:offset]) 
    render json: @areas.to_json(:include => :country,:include => :destinations, methods: :url)
  end

  def show
    @area = Area.find(params[:id])
    render json: @area.to_json(:include => :country,:include => :destinations, methods: :url)
  end


end
