class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update]
  before_filter :correct_user,   only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render :edit
    end
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Congrats! You successfully created an account!"
      redirect_to @user
    else
      render :new
    end
  end

  protected

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_path, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end
