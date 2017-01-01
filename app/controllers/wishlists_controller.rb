class WishlistsController < ApplicationController

	def destroy
		@wishlist = Wishlist.find(params[:id])
		@wishlist.destroy
		flash[:success] = "Product has been removed"
		redirect_to :back
	end
end