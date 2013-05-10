class PagesController < ApplicationController
  def new
    respond_with @page = Page.new
  end
  def create
    respond_with @page = Page.create_from_url(params[:page])
  end
  def show
    respond_with @page = Page.find(params[:id]), layout: false
  end
end
