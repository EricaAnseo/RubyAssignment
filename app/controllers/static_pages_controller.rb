class StaticPagesController < ApplicationController
  def shop
  	if logged_in?
        @product  = current_user.products.build
        @feed_items = current_user.feed
     end
  end

  def help
  end

  def contact
  end

  def about
  	
  end

  def toc
  end
end
