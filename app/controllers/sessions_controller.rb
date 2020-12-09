class SessionsController < ApplicationController
  before_action :all_users, only: [:new]
  before_action :redirect_already_logged_in, only: [:new]

  def create
    @user = User.find_by_id(params[:user_name])
    
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:message] = "Incorrect Password"
      all_users
      render :new
    end
  end

  def google_login
    user_name = request.env['omniauth.auth']['info']['name']
    @user = User.find_or_create_by(user_name: user_name) do |user|
        user.user_name = user_name
        user.password = SecureRandom.hex
    end
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

  private

  def all_users
    @users = User.all
  end
end
