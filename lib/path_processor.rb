require 'nokogiri'

class PathProcessor
  def initialize(url, html)
    @html = html
    @url = url
  end

  def process_paths
    doc.xpath("//a[@href]").each do |anchor|
      href = anchor.attributes["href"].value
      if href.start_with?("/")
        new_href = "/pages/#{base_url}#{href}"
      elsif match_data = href.match(/^http(s?):\/\/(.*)/)
        new_href = "/pages/#{match_data[2]}"
      else
        new_href = "/pages/#{url}#{href}"
      end
      anchor.attributes["href"].value = new_href
    end
    doc.to_html
  end

  private

  def url
    @url
  end

  def base_url
    @url.split("/").first
  end

  def doc
    @doc ||= Nokogiri:: HTML(@html)
  end

end
