class DestinationController < ApplicationController

  def observation
    @result = params[:result].present? ? params[:result] : "Enter An Observation"
    if params[:destination_id].present?
      @destination = Destination.find(params[:destination_id]) 
    else
      Destination.new
    end
  end

  def update
    section = Section.find_by_section_number(params[:section_number]) if params[:section_number].present?
    @destination = section.destinations.where(:destination_type => params[:destination][:destination_type]).first unless section.nil?
    if @destination.present? 
      @destination.update_attributes(
        :current_wait_time => params[:destination][:current_wait_time].to_i, 
        :current_report_time => Time.now )
      @result = "destination updated"
      Pusher['observations'].trigger('observation', @destination)
    else
      @result = "destination could not be found"
    end
    redirect_to :controller => 'destination', :action => 'observation', :result => @result, :destination_id => @destination and return
  end

end
