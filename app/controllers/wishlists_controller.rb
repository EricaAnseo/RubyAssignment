class WishlistsController < ApplicationController
	before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  	before_action :correct_user,   only: [:edit, :update]

	def destroy
		@wishlist = Wishlist.find(params[:id])
		@wishlist.destroy
		flash[:success] = "Product has been removed"
		redirect_to :back
	end
end