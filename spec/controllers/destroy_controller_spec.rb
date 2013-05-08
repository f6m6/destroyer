require 'spec_helper'

describe DestroyController do

  describe "GET 'smash'" do
    it "returns http success" do
      get 'smash'
      response.should be_success
    end
  end

end
