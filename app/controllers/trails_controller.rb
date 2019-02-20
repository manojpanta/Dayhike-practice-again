 class TrailsController < ApplicationController
   def index
     @trails = Trail.all
   end
   def show
     @trail = Trail.find_by(slug: params[:slug])
     @trips = @trail.trips
     @total_trips = @trail.total_trips
   end
 end
