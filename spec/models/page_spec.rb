require 'spec_helper'

describe Page do
  subject(:page) { Page.new }

  describe '#cache_destroyed_content' do
    before do
      page.destroyer = double('destroyer', content: 'destroyed')
      page.cache_destroyed_content
    end

    it 'stores the response from Destroyer' do
      page.content.should == 'destroyed'
    end

    it 'saves the content for later' do
      page.should_not be_new_record
    end
  end
end
