require 'nokogiri'
require 'open-uri'

class DestroyController < ApplicationController
  def index
    @url = params[:url]
    @doc = Nokogiri::HTML(open('http://' + @url))
  end
end
