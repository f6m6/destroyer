require 'spec_helper'

describe PagesController do
  subject(:pages_controller) { PagesController.new }
  describe "#create" do
    it "responds with the correct page" do
      response.should == "hello"
    end
  end
end
