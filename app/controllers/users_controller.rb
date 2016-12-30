class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]

	def show
	  @user = User.find(params[:id])
    @products = @user.products 
    @product = current_user.products.build if logged_in?
    if logged_in?
        @product  = current_user.products.build
        @feed_items = current_user.feed
    end
	end

  def index
    @users = User.paginate(page: params[:page], :per_page => 20)
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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def feed
    Product.where("user_id = ?", id)
  end

  private def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

end
