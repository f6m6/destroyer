require 'nokogiri'
require 'open-uri'
require 'dreadnought'

class Page < ActiveRecord::Base
  attr_accessible :content, :url

  def self.create_from_url(attributes)
    attributes[:content] = open('http://' + attributes[:url]).read
    create(attributes)
  end

  def destroyed_content
    Dreadnought.new(content).destroy
  end
 
end
