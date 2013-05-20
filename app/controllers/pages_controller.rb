class PagesController < ApplicationController

  def new
    respond_with @page = Page.new
  end

  def create
    existing_pages = Page.where(url: params[:page]['url'])
    existing_pages.sort_by! { |p| p['slug'] }
    @existing_page = existing_pages.first
    
    unless @existing_page.nil?
      respond_with @existing_page and return
    end

    @page = Page.create(params[:page])
    if @page.save
      respond_with @page
    else
      render action: 'new'
    end
  end

  def show
    begin
      respond_with @page = Page.find(params['id']), layout: false
    rescue ActiveRecord::RecordNotFound
      @page = Page.create(url: params['id'])
      if @page.save
        respond_with @page
      else
        render action: 'new'
      end
    end
  end

end
