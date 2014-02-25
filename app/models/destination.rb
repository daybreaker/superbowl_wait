# == Schema Information
#
# Table name: destinations
#
#  id                  :integer          not null, primary key
#  unique_id           :integer
#  destination_type    :string(255)
#  current_status      :string(255)
#  current_report_time :datetime
#  lat                 :string(255)
#  long                :string(255)
#  name                :string(255)
#  description         :text
#  source              :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  lot_size            :string(255)
#  authorized_phones   :text             default("")
#  gmap_lat_lng        :text             default("")
#

class Destination < ActiveRecord::Base

  attr_accessible :unique_id, :current_report_time, :current_status, :lat, :long, :destination_type, :name, :description, :source, :updates, :lot_size, :authorized_phones, :updates, :gmap_lat_lng

  has_many :updates
  
  IMAGE = {
    :width => 1564,  	
    :height => 3040  
  }  
  
  STATUSES = {
    '1' => "low",
    '2' => "high",
    '5' => "medium"
  }
  
  MINUTES_FOR_STALENESS = 60
  
  def stale?
    current_report_time.blank? || current_report_time < MINUTES_FOR_STALENESS.minutes.ago || !STATUSES.include?(current_status)
  end
  
  def status
    stale? ? "stale" : current_status
  end

end
