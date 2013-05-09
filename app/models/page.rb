require 'nokogiri'
require 'open-uri'
require 'dreadnought'

class Page < ActiveRecord::Base
  attr_accessible :content, :url

  def self.create_from_url(url)
    require 'open-uri'
    content = open('http://' + url).to_a.join
    @page = Page.new(url: url, content: content)
  end

  def destroyed_content
   # Dreadnought.new(@content).destroy
  end
 
end
