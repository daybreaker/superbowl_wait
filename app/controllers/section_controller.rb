class SectionController < ApplicationController

  def index
    
  end
  
  
   def show
    chunk = Section.find_by_section_number(params[:id]).chunk
    redirect_to :controller => chunk, :action => show, :chunk => chunk

  end

end
