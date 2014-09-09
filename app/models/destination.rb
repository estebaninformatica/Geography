#!/bin/env ruby
# encoding: utf-8

class Destination < ActiveRecord::Base
	belongs_to :area
	delegate :country,:assistance_fare_group, :to => :area
	include Rails.application.routes.url_helpers
	include UrlMethod

end