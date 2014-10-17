#!/bin/env ruby
# encoding: utf-8

class Area < ActiveRecord::Base
	has_many :destinations
	belongs_to :country
	delegate :assistance_fare_group, :coin, :argentina?, :regions, :to => :country
	include Rails.application.routes.url_helpers
	include UrlMethod
	
	scope :search, ->(term) { where('areas.name LIKE ?', "%#{term}%").order("areas.name") }
end