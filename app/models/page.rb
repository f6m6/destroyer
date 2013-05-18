require 'nokogiri'
require 'open-uri'
require 'dreadnought'

class Page < ActiveRecord::Base
  validates :url, presence: true, url: true
  after_save :populate_content

  attr_accessible :content, :url

  def populate_content
    self.update_attributes(content: open('http://' + url).read)
  end

  def destroyed_content
    populate_content if content.nil?
    Dreadnought.new(content).destroy
  end
end
