class ProductsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]
	before_action :correct_user,   only: :destroy

	def create
		secure_post = params.require(:product).permit(:description)
		@product = current_user.products.build(secure_post) 
		if @product.save
			flash[:success] = "Product created!"
			redirect_to root_url
		else
			@feed_items = []
			render 'user/:user.id'
		end
	end

	# UPDATED IMPLEMENTATION
	def destroy
		@product.destroy
		flash[:success] = "Product deleted"
		redirect_to root_url
	end

	# NEW PRIVATE METHOD
	private
		def correct_user
		  @product = current_user.products.find_by(id: params[:id])
		  redirect_to root_url if @product.nil?
		end
	end

end