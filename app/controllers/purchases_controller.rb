class PurchasesController < ApplicationController
	
	def shop
		@purchase = Purchase.new
		@product = Product.find(params[:product_id])
		product = Product.find(params[:product_id])
	end

	def show
	    
	end

	def profile
	    @purchase = Purchase.new 
		product = Product.find(params[:product_id])
	end


	def new
		@purchase = Purchase.new 
		product = Product.find(params[:product_id])
	end

	def create
		secure_purchase = params.require(:purchase).permit(:amount)
		@purchase = current_user.purchases.build(secure_purchase) 
		if @purchase.save
			flash[:success] = "Product bought!"
			redirect_to root_url
		else
			@feed_items = []
			redirect_to root_url
		end
	end

	def purchase_params
	   params.require(:purchase).permit(:amount)
	end

end



