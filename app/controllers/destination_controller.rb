class DestinationController < ApplicationController

  def index
    @destinations = Destination.all
  end

  def show
    @destination = Destination.find_by_unique_id(params[:unique_id])
    @updates = Update.find_by_destination_id(@destination.unique_id) unless @destination.nil?
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

  # handle updates AND SMS status requests
  def update
    source = 'web'
    #flush  #get rid of updates that are too OLD

    # get the parameters from the POST
    if params[:Body].present? && params[:From].present?
      # SMS message from Twilio received to webhook
      if params[:Body][0..2] == '999'
        # SMS request for status - NOT an update
        unique_id = params[:Body][3, (params[:Body].length - 3)]
        @result = 'status of'
      else
        unique_id = params[:Body].chop
        status = params[:Body][unique_id.length]
      end
      source = params[:From]
    elsif params[:destination].present? && params[:destination][:unique_id].present?  
      # update from the Web   
      unique_id = params[:destination][:unique_id]
      status = params[:destination][:current_status]
    else
      @result = "unknown"
    end

    # find the destination from the parameters
    destination = Destination.find_by_unique_id(unique_id) unless @result == "unknown"

    # make the update if there is one
    if destination.nil?
      @result = "unknown"
    elsif source != 'web' && !authorized(destination, source)
      @result = "denied"
    elsif @result != 'status of'
      # we have an update, NOT a status request
      unless destination.current_status.nil?
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
      @result = "updated"
    end

    # send a reply SMS if one is called for
    if source == 'web'
      # Web update (there are no Web status requests)
      if @result == "unknown"
        redirect_to  :controller => 'destination', :action => 'observation'  and return
      else
        redirect_to :controller => 'destination', :action => 'observation', :result => @result, :unique_id => destination.unique_id and return
      end
    else
      # SMS update or status request
      if @result == "denied"
        @text = "update to #{unique_id} #{@result}"
      elsif @result == "unknown"
        @text = "#{unique_id}: #{@result}"
      elsif @result == 'status of'
        @text = "#{@result} for #{unique_id} is #{destination.current_status}"
      else
        # if this was an update, do NOT send reply
        @text = ''
      end
      response.content_type = 'text/plain'
      render :text => @text and return
    end

  end
  
  def get_image  	
    render :layout => false
  end

  # flush out any destinations whose last update is too old
  # put current update into updates table
  # change destination to have 
  #       status = "old", and
  #       source = id of last known update
  def flush
    Destination.all.each do |d|
      return true
      if d.current_report_time && (Time.now - d.current_report_time) > 1.hour
        unless d.current_status.nil?
          #save current values in history
          update = d.updates.new
          update.source = d.source 
          update.reported_at = d.current_report_time 
          update.status = d.current_status
          update.save
          d.source = update.id.to_s
        end
        d.current_status = "old" 
        d.save
      end
    end
  end

  # make sure SMS source has the privileges to update this destination
  def authorized(destination, source)
    access_list = destination.authorized_phones
    if access_list.empty?
      return false
    else
      return !access_list.index(source).nil?
    end
  end

end
