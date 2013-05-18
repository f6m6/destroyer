class PagesController < ApplicationController
  def new
    respond_with @page = Page.new
  end
  def create
    @page = Page.create(params[:page])
    if @page.save
      respond_with @page
    else
      render action: 'new'
    end
  end
  def show
    respond_with @page = Page.find(params[:id]), layout: false
  end
end
