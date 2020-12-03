class PlanetsController < ApplicationController
    before_action

    def index
        @planets = Planet.all
    end

    def show
        @planet = Planet.find_by_id(params[:id])
    end
end
