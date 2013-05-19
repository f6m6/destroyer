require 'spec_helper'

describe Page do
  subject(:page) { Page.new }

  describe 'validation' do
    it 'should fail validation with no url' do
      Page.new.should_not be_valid
    end
    it 'should fail validation with an invalid url' do
      Page.create(url: "an invalid url").should_not be_valid
    end
    it 'should pass validation with a valid url' do
      Page.create(url: "test.com").should be_valid
    end
  end

  describe '#populate_content' do
    it 'should populate content' do
      p = Page.create(url: "apple.com", content: nil)
      p.populate_content
      p.content.should_not be_nil
    end
  end

  describe '#destroyed_content' do
    it 'populates content if content is nil' do
      p = Page.create(url: "apple.com", content: nil)
      p.destroyed_content
      p.content.should_not be_nil
    end
    it 'destroys the page content' do
      q = Page.create(url: "apple.com", content: nil)
      q.populate_content
      destroyed_before = q.content.scan(/destroyed/).length
      destroyed_after = q.destroyed_content.scan(/destroyed/).length
      destroyed_after.should > destroyed_before
    end
  end
end
