class TravelPlansController < ApplicationController
    def index
      @travel_plans = TravelPlan.all
    end
end
