class StaticPagesController < ApplicationController
  def shop
  	if logged_in?
        @product  = current_user.products.build
        @feed_items = current_user.feed
     end
  end

  def help
  end

  def about
  	flash[:notice] = "Testing the flash"
  end

  def toc
  end
end
