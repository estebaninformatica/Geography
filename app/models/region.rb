#!/bin/env ruby
# encoding: utf-8

class Region < ActiveRecord::Base
	has_and_belongs_to_many :countries
    has_one :region_photo
    include Rails.application.routes.url_helpers
	include UrlMethod
  	

end