class ProductsController < ApplicationController
	before_action :logged_in_user, only: [:create, :edit, :update, :destroy]
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
			:description, :price, :ship_cost, :stock, :avatar, :category_id)
		@product = current_user.products.build(secure_post) 
		if @product.save
			#product.category = Product.find(params[:category_id])
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

	def upvote 
	  @product = Product.find(params[:id])
	  @product.upvote_by current_user
	  redirect_to :back
	end  

	def downvote
	  @product = Product.find(params[:id])
	  @product.downvote_by current_user
	  redirect_to :back
	end

	def correct_product
      @product = Product.find(params[:id])
      redirect_to(root_url) unless @product == current_product
    end

	def purchase
		secure_purchase = params.require(:purchase).permit(:amount)
		purchase = Purchase.new(secure_purchase)
		purchase.user = current_user
		purchase.product = Product.find(params[:id])
		product = Product.find(params[:id])

		if purchase.save
			#product.stock -= purchase.amount
			#product.save
			flash[:success] = "Product bought!"
			redirect_to root_url
		else
			@feed_items = []
			render 'users/show'
		end
	end

	def add_to_wishlist
		wishlist = Wishlist.new()
		wishlist.user = current_user
		wishlist.product = Product.find(params[:id])
		if wishlist.save
			redirect_to root_url
		else
			redirect_to root_url
		end
	end

	def remove_from_stock
	    product.stock -= self.quantity
	    product.save
	end

	private def product_params
    	params.require(:product).permit(:prodname, :description, :price, :ship_cost, :stock, :avatar, :category_id)
  	end

  	def purchase_params
	   params.require(:purchase).permit(:amount)
	end

	def wishlist_params
	   params.require(:wishlist).permit(:id)
	end

	

end