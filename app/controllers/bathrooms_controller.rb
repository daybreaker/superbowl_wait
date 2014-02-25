class BathroomsController < ApplicationController
  def index
    @destinations = Bathroom.all.to_json
    @maps = true
    @bathroom = Bathroom.new
    puts @destinations.to_s
  end

  def create
    @bathroom = Bathroom.new(params[:bathroom])
    @bathroom.save
    redirect_to root_path
  end

private
    def post_params
      params[:bathroom].slice(:address1, :address2, :city, :state, :zip)
    end
end
