class UsersController < ApplicationController
	def show
	  @user = User.find(params[:id])
    @products = @user.products 
    @product = current_user.products.build if logged_in?
	end

	def new
	 @user = User.new
	end

	def create
    secure_params = params.require(:user).permit(:name, :email, 
                              :password, :password_confirmation)
    @user = User.new(secure_params)
    if @user.save
      # Handle a successful save.
      remember @user 
      flash[:success] = "Welcome to Chai Store!"
      redirect_to @user
    else
      # Handle an unsuccessful save.  
      render 'new' 
    end
  end
end
