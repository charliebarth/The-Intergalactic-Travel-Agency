class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]
    before_action :redirect_already_logged_in, only: [:new]
    before_action :redirect_anon_users_to_home, only: [:show, :edit, :update, :destroy]
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
  
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        render :new
      end
    end
  
    def edit
      unless helpers.has_access
        flash[:message] = "You do not have access to Edit this User"
        render 'partials/flash_messages'
      end
    end
  
    def update
      if @user.update(user_params)
        redirect_to user_path(@user)
      else
        render :edit
      end
    end

    def destroy
      current_user.visits.destroy
      current_user.destroy
      redirect_to root_path
    end
  
    private
  
    def user_params
      params.require(:user).permit(:user_name, :password, :bio)
    end
  
    def find_user
      @user = User.find_by_id(params[:id])
      render_error(params[:id], User.user_name, user_index_path) unless @user
    end
end
