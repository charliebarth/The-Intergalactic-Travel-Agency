class PlanetsController < ApplicationController
    before_action :redirect_to_signup_if_not_logged_in

    def index
        @planets = Planet.all
    end

    def show
        @planet = Planet.find_by_id(params[:id])
    end
end
