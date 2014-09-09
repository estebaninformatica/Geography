#!/bin/env ruby
# encoding: utf-8

class Country < ActiveRecord::Base
	has_and_belongs_to_many :regions
	has_many :areas
	belongs_to :coin
	include Rails.application.routes.url_helpers
	include UrlMethod
end