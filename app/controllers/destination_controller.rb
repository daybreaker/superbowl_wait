class DestinationController < ApplicationController

  def index
    @destinations = Destination.all
  end

  def show
    @destination = Destination.find_by_unique_id(params[:unique_id])
    @updates = Update.find_by_destination_unique_id(@destination.unique_id) unless @destination.nil?
  end

  def observation
    @body_class = "observation"
    @result = params[:result].present? ? params[:result] : "Enter An Observation"
    if params[:unique_id].present?
      @destination = Destination.find_by_unique_id(params[:unique_id]) 
    else
      @destination = Destination.new
    end
    @destinations = Destination.all
  end

  def update
puts "\n**********************************************************\n"   
puts "params = #{params}"
puts "\n**********************************************************\n" 
    source = 'web'
    if params[:body].present? && params[:from].present?
      # SMS message from Twilio received to webhook
      unique_id = params[:body].chop
      status = params[:body][unique_id.length]
      source = params[:from]
    elsif params[:destination][:unique_id].present?     
      unique_id = params[:destination][:unique_id]
      status = params[:destination][:current_status]
    else
      @result = "destination could not be found"
    end
    destination = Destination.find_by_unique_id(unique_id)
    if destination.nil?
      @result = "destination could not be found"
    else
      # make the update
      unless destination.current_status.empty?
        #save current values in history
        update = destination.updates.new
        update.source = destination.source 
        update.reported_at = destination.current_report_time 
        update.status = destination.current_status
        update.save
      end
      destination.current_status = status 
      destination.source = source
      destination.current_report_time = Time.now
      destination.save
      @result = "destination updated"
    end
    if source == 'web'
      redirect_to :controller => 'destination', :action => 'observation', :result => @result, :unique_id => @destination_unique_id and return
    else
      render :text => '' and return
    end
  end

end
