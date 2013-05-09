require 'nokogiri'

class Dreadnought
  def initialize(html)
    @html = html
  end
  
  def destroy
    demonise_images
    randomise_capitalisation
    doc.to_html
  end
  
  private
  
  def doc
    @doc ||= Nokogiri::HTML(@html)
  end

  def demonise_images
    doc.css('img').each do |node|
      node[:style] = %q{
         -webkit-transform: matrix(1, 0, 0, -1, 0, 0);
         -webkit-filter: invert(100%);
      }
    end
  end

  def randomly_capitalise(s)
    s = s.split("").map do |character|
      rand(2).times { character.upcase!}
      character
    end.join
  end

  def randomise_capitalisation
    doc.xpath("//text()").each do |node|
      node.content = randomly_capitalise(node.content.to_s)
    end
  end

end
