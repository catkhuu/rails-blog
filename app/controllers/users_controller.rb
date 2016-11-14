class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
  end

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:success] = 'Welcome to the SplootBlog community!'
      redirect_to user
    else
      @errors = user.errors.full_messages
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
