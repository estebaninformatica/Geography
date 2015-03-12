#!/bin/env ruby
# encoding: utf-8

class Airport < ActiveRecord::Base
  has_and_belongs_to_many :areas
  belongs_to :area
  delegate :country, to: :area
  delegate :regions, to: :area
  include Rails.application.routes.url_helpers
  include UrlMethod

  def contains_area(area)
    return self.areas.include?(area)
  end

  def to_json_middle
    {
      id: id,
      code: iata_code,
      name: name,
      country_id: country.id,
      country_name: country.name,
      area_id: area.id,
      area_name: area.name,
      url: url,
      regions: regions.map { |region| { region_id: region.id, region_name: region.name }
      },
      areas: areas.map { |area| { area_id: area.id, area_name: area.name }
      }
    }
  end

  scope :search, ->(term) { where('airports.name LIKE ?', "%#{term}%").order("airports.name") }
end
