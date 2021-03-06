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
        @wishlist  = current_user.products.build
        @wishlist_items = current_user.feed_wishlist
        @purchase  = current_user.products.build
        @purchase_items = current_user.feed_purchase

    end
	end

  def profile
    @user = User.find(params[:id])
    @feed_items = @user.feed
    @purchase = Purchase.new 
    user = User.find(params[:id])
    @reputations = Reputation.where(reviewee_id: params[:id])
    @rep = Reputation.new
  end

  def index
    @users = User.paginate(page: params[:page], :per_page => 12)
  end

	def new
	  @user = User.new
    @reputation = Reputation.new 
	end

	def create
    secure_params = params.require(:user).permit(:name, :email, 
                              :password, :password_confirmation, :avatar)
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

  private def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :avatar)
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

  def reputation 
    secure_reputation = params.require(:reputation).permit(:id, :rating, :comment)
    reputation = Reputation.new(secure_reputation)
    reputation.reviewer_id = current_user.id
    user = User.find(params[:id])
    reputation.reviewee_id = user.id

    if reputation.save
      redirect_to :back
    else

    end
  end

end
