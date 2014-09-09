class Api::V1::RegionsController < ApplicationController

  def index
    @regions = Region.limit(params[:limit]).offset(params[:offset])
    render json: @regions.to_json(:include => :countries, methods: :url)
  end

  def show
    @region = Region.find(params[:id])
    render json: @regions.to_json(:include => :countries, methods: :url)
  end

end
