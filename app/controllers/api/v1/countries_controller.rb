class Api::V1::CountriesController < ApplicationController

  def index
    @countries = Country.limit(params[:limit]).offset(params[:offset])
    render json: @countries.to_json(:include => :regions,:include => :areas, methods: :url)
  end

  def show
    @country = Country.find(params[:id])
    render json: @country.to_json(:include => :regions,:include => :areas, methods: :url)
  end

end
