# /css/style.css -> /pages/11/css/style.css
class PageProxyController < ApplicationController
  def show
    get request.path
  end
  
  private
  
  def get(path)
    raise NotImplementedError
    # "#{page.url}/#{path}"
  end
  
  def page
    @page ||= Page.find(params[:page_id])
  end
end
