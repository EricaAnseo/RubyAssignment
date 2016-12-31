class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  #encountered authentication error when updating products. 
  protect_from_forgery with: :null_session
  include SessionsHelper

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
end
