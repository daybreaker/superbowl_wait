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
    if params[:body].present? && params[:from].present?
    # SMS message from Twilio received to webhook
      unique_id = params[:body].chop
      status = params[:body][unique_id.length]
      destination = Destination.find_by_unique_id(unique_id)
      unless destination.nil?
        # make the update
        unless destination.current_status.empty?
          #save current values in history
          Destination.updates.create(:source => destination.source, 
            :reported_at => destination.current_report_time, 
            :status => destination.current_status)
        end
        destination.update_attributes(:current_status => status, 
          :source => params[:from], :current_reported_time => Time.now)
      end
      render :text => '' and return
    else       
      # update received via our update form
      @body_class = "observation"
      @destination = Destination.find_by_unique_id(params[:destination][:unique_id])
      if @destination.present? 
        @destination.update_attributes(
          :current_status => params[:destination][:current_status], 
          :current_report_time => Time.now )
        @result = "destination updated"
      else
        @result = "destination could not be found"
      end
      redirect_to :controller => 'destination', :action => 'observation', :result => @result, :unique_id => @destination_unique_id and return
    end
  end

end
