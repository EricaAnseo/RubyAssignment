class ProductsController < ApplicationController
	before_action :logged_in_user, only: [:create, :update, :destroy]
	before_action :correct_user,   only: :destroy

	def shop
		@products = Product.all.order('created_at DESC').paginate(page: params[:page], :per_page => 20)
		@purchase = Purchase.new
	end

	def new
		@product = Product.new
		@purchase = Purchase.new 
	end

	def create
		secure_post = params.require(:product).permit(:prodname, 
			:description, :price, :ship_cost, :stock, :avatar)
		@product = current_user.products.build(secure_post) 
		if @product.save
			flash[:success] = "Product created!"
			redirect_to root_url
		else
			@feed_items = []
			render 'users/show'
		end
	end

	def edit
	    @product = Product.find(params[:id])
  	end

	def update
	    @product = Product.find(params[:id])
	    if @product.update_attributes(product_params)
	      flash[:success] = "Product updated"
	      redirect_to @product
	    else
	      render 'edit'
	    end
  	end

	# UPDATED IMPLEMENTATION
	def destroy
		@product.destroy
		flash[:success] = "Product deleted"
		redirect_to root_url
	end

	# NEW PRIVATE METHOD
	#private def correct_product
		#@product = current_user.products.find_by(id: params[:id])
		#redirect_to root_url if @product.nil?
	#end

	def correct_product
      @product = Product.find(params[:id])
      redirect_to(root_url) unless @product == current_product
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

	def remove_from_stock
	    product.stock -= self.quantity
	    product.save
	end

	private def product_params
    	params.require(:product).permit(:prodname, 
			:description, :price, :ship_cost, :stock, :avatar)
  	end
end