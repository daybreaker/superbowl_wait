# == Schema Information
#
# Table name: destinations
#
#  id                  :integer          not null, primary key
#  destination_type    :string(255)
#  current_wait_time   :string(255)
#  current_report_time :datetime
#  lat                 :integer
#  long                :integer
#  closest_section     :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Destination < ActiveRecord::Base
  attr_accessible :closest_section, :current_report_time, :current_wait_time, :lat, :long, :destination_type

  def destination_type_enum
    ['men', 'women', 'family', 'concession']
  end
  
  def self.nearest_to_section(section)
      find(:first, :order => "ABS(closest_section - #{section}) ASC")
  end

  def current_wait_time_enum
    ['low', 'medium', 'high', 'very high']
  end
  
end
