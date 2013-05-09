require 'nokogiri'
require 'open-uri'

class DestroyController < ApplicationController
  def index
    @url = params[:url]
    fmt = params[:format]
    if fmt
      @url = "#{@url}.#{params[:format]}"
    end
    @doc = "la"
    p = Page.create_from_url(@url)
    p.save
    @content = p.content
    @destroyed = Dreadnought.new(@content).destroy
  end
end
