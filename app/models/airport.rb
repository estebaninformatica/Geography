#!/bin/env ruby
# encoding: utf-8

class Airport < ActiveRecord::Base
  has_and_belongs_to_many :areas
  belongs_to :area
  delegate :country, to: :area
  delegate :regions, to: :area

  def contains_area(area)
    return self.areas.include?(area)
  end

  def country_name
    country.name
  end

  def country_id
    country.id
  end


  scope :search, ->(term) { where('airports.name LIKE ?', "%#{term}%").order("airports.name") }
end
