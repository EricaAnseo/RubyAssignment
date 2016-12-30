class PurchaseController < ApplicationController
	#def shop
		#@purchase = Purchase.new
	#end

	def new
		@purchase = Purchase.new 
	end

	def create
		secure_post = params.require(:purchase).permit(:prodname, 
			:description, :price, :ship_cost, :stock)
		@purchase = current_user.purchases.build(secure_post) 
		if @purchase.save
			flash[:success] = "Purchase made"
			redirect_to root_url
		else
			@feed_items = []
			render 'user/:user.id'
		end
	end

end



