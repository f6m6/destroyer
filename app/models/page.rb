require 'nokogiri'
require 'open-uri'
require 'open_uri_redirections'
require 'dreadnought'

class Page < ActiveRecord::Base
  extend FriendlyId
  friendly_id :url, use: :slugged
 
  validates :url, presence: true, url: true
  attr_accessible :content, :url

  def normalize_friendly_id(string)
    string
  end

  def populate_content
    content = open('http://' + url, allow_redirections: :all).read
    self.update_attributes(content: content)
  end

  def destroyed_content
    populate_content if content.nil?
    path_processed_content = PathProcessor.new(url, content).process_paths
    Dreadnought.new(path_processed_content).destroy
  end
end

