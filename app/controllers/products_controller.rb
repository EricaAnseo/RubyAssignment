class ProductsController < ApplicationController
	before_action :logged_in_user, only: [:create, :update, :destroy]
	before_action :correct_user,   only: :destroy

	def shop
		@products = Product.all.order('created_at DESC')
		@purchase = Purchase.new
	end

	def new
		@product = Product.new
		@purchase = Purchase.new 
	end

	def create
		secure_post = params.require(:product).permit(:prodname, 
			:description, :price, :ship_cost, :stock)
		@product = current_user.products.build(secure_post) 
		if @product.save
			flash[:success] = "Product created!"
			redirect_to root_url
		else
			@feed_items = []
			render 'users/show'
		end
	end

	def update
	    @product = current_product
	    @product_item = @product.order_items.find(params[:id])
	    @product_item.update_attributes(product_item_params)
	    @product_items = @product.product_items
  	end

	# UPDATED IMPLEMENTATION
	def destroy
		@product.destroy
		flash[:success] = "Product deleted"
		redirect_to root_url
	end

	# NEW PRIVATE METHOD
	private def correct_user
		  @product = current_user.products.find_by(id: params[:id])
		  redirect_to root_url if @product.nil?
	end

	def add_to_cart
		secure_post = params.require(:purchase).permit(:id)
		@purchase = current_user.purchases.build(secure_post) 
		if @purchase.save
			flash[:success] = "Product bought!"
			redirect_to root_url
		else
			@feed_items = []
			render 'users/show'
		end
	end

	def add_to_wishlist
		secure_post = params.require(:purchase)
		@wishlist = current_user.purchases.build(secure_post) 
		if @wishlist.save
			flash[:success] = "Product bought!"
			redirect_to root_url
		else
			@feed_items = []
			render 'users/show'
		end
	end
end