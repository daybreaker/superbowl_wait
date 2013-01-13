class SectionController < ApplicationController

  def index
  end

  def get_image
    render :layout => false
  end
  
  def show
    @section = Section.find_by_section_number(params[:section])

  end

end
