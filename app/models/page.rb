require 'nokogiri'
require 'open-uri'
require 'dreadnought'

class Page < ActiveRecord::Base
  attr_accessible :content, :url

  attr_writer :destroyer

  def self.create_from_url(attributes)
    attributes[:content] = open('http://' + attributes[:url]).read
    create(attributes)
  end

  def cache_destroyed_content
    self.content = destroyer.content
    save
  end

  def destroyed_content
    Dreadnought.new(content).destroy
  end

  private

  def destroyer
    @destroyer ||= Dreadnought.new(self)
  end
end
