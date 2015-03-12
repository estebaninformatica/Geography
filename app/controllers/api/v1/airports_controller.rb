class Api::V1::AirportsController < ApplicationController

  def index
    @airports = Airport.search(params[:criteria]).limit(params[:limit]).offset(params[:offset])

    airports_hash = @airports.map do |airport|
      {
        id: airport.id,
        code: airport.iata_code,
        name: airport.name,
        country_id: airport.country_id,
        country_name: airport.country.name,
        area_id: airport.area.id,
        area_name: airport.area.name,
        regions: airport.regions.map { |region| { region_id: region.id, region_name: region.name }
        },
        areas: airport.areas.map { |area| { area_id: area.id, area_name: area.name }
        }
      }
    end

    render json: airports_hash
  end

  def show
    @airport = Airport.find(params[:id])
    render json: @airport.to_json(:include => [:areas], methods: :url)
  end


end
