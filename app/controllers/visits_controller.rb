class VisitsController < ApplicationController
    before_action :redirect_anon_users_to_home

    def new
      @private_options = [true, false]
      @visit = Visit.new(user_id: params[:user_id], planet_id: params[:planet_id])
    end
    

    def create
      @visit = Visit.new(visit_params)
      if @visit.save
        flash[:message] = "You have visited this planet"
        redirect_to user_path(current_user)
      else 
        redirect_to planets_path
      end
    end

    def index
      if params[:user_id]
        @show_private_status = true
        @visits = User.find(params[:user_id]).visits

      else
        @visits = Visit.not_private
      end
    end

    private

    def visit_params
        params.require(:visit).permit(:user_id, :planet_id, :private)
    end
      
end
