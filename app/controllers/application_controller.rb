class ApplicationController < ActionController::Base
  protect_from_forgery
  
  respond_to :html
  
  def self.exposes(*methods)
    attr_reader *methods
    helper_method *methods
  end
end
