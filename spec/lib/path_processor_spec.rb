require 'spec_helper'
require 'nokogiri'

describe PathProcessor do

  describe "process_paths" do   
    path_processor = PathProcessor.new("base-url.co.uk/directory", "<a href='/jobs/uk'></a>
      <a href='jobs'></a>
      <a href='http://apple.com'></a><a href='https://apple.com'" )
    doc = Nokogiri::HTML(path_processor.process_paths)
    as =  doc.xpath("//a[@href]").to_a

    it "should rewrite relative-to-root paths" do
      as[0].attributes["href"].value.should == "/pages/base-url.co.uk/jobs/uk"
    end
    it "should rewrite a relative-to-current-dir path" do
      as[1].attributes["href"].value.should == "/pages/base-url.co.uk/directory/jobs"
    end
    it "should rewrite an absolute http path" do
      as[2].attributes["href"].value.should == "/pages/apple.com"
    end
    it "should rewrite an absolute https path" do
      as[3].attributes["href"].value.should == "/pages/apple.com"
    end
  end

end
