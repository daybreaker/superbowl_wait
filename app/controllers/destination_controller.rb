class DestinationController < ApplicationController

  def edit
    if params[:dtype].present? && params[:section]
      @destination = Destination.where(:destination_type => params[:dtype], :current_section => params[:section]).first
    end
    unless @destination.present?
      render :text => "no destination of type #{params[:dtype]} and section #{params[:section]}" and return
    end
  end

  def update
    @destination = Destination.find(params[:destination_id])
    if @destination.present? 
      @destination.update_attributes(:current_wait_time => params[:current_wait_time], 
        :current_report_time => params[:current_report_time])
      @result = "destination updated"
    else
      @result = "destination could not be found"
    end
    @destination = Destination.new
    @render :template => :manual_entry
  end

end
