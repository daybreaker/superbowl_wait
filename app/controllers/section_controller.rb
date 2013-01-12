class SectionController < ApplicationController

  def index
    
  end
  
  
  def show
    @section = params[:section]
    @nearest = Destination.nearest_to_section(@section)
  end

end
