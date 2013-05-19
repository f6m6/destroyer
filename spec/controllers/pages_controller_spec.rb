require 'spec_helper'

describe PagesController do
  subject(:pages_controller) { PagesController.new }
    
  describe "GET #new" do
    it "assigns a new Page to @page" do
      get :new
      assert_not_nil assigns(:page)
    end
    it "responds successfully" do
      response.status.should eq 200
    end
  end
    
  describe "POST #create" do
    it "saves the new page in the database" do
      post :create, page: {url: 'test.com', content: 'html' }
      assert_redirected_to page_path(assigns(:page))
    end
    it "doesn't save invalid pages" do
      post :create, page: {url: '::::', content: nil}
      response.should render_template :new
    end
  end

  describe "GET #show" do
    it "assigns the requested page to @page" do
      page = Page.create(url: 'test.com', content: 'html')
      get :show, id: page.id
      assigns(:page).url.should == 'test.com'
    end
    it "renders the :show template" do
      response.status.should eq 200
    end
  end
end
