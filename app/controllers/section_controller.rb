class SectionController < ApplicationController

  def index
    
  end
  
  
  def show
    @section = params[:section]

  end
  
  def get_image
    render :layout => false
  end

end
