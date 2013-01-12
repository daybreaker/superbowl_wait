class SectionController < ApplicationController

  def index
  end
  
  
   def show
    @section = Section.find_by_section_number(params[:section])
  end

end
