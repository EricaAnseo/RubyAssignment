class PurchasesController < ApplicationController
	before_action :logged_in_user, only: [:create, :update, :destroy]
	before_action :correct_user,   only: :destroy

	def shop
		@purchase = Purchase.new
		@product = Product.find(params[:product_id])
		product = Product.find(params[:product_id])
	end

	def new
		@purchase = Purchase.new 
		product = Product.find(params[:product_id])
	end

	def create
		secure_post = params.require(:purchase).permit(:id)
		@purchase = current_user.purchases.build(secure_post) 
		if @purchase.save
			flash[:success] = "Product bought!"
			redirect_to root_url
		else
			@feed_items = []
			redirect_to root_url
		end
	end

end



