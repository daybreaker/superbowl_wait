class BathroomsController < ApplicationController
  def index
    @destinations = Bathroom.all.group_by(&:status).to_json
    @maps = true
    puts @destinations.to_s
  end
end
