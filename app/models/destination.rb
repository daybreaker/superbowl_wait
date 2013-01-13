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
#  name                :string(255)
#  description         :text
#

class Destination < ActiveRecord::Base
 attr_accessible :closest_section, :current_report_time, :current_wait_time, :lat, :long, :destination_type, :name, :description

  belongs_to :section, :foreign_key => :closest_section, :primary_key => :section_number
  
  WAIT_TIMES = {
    "low" => 1,
    "medium" => 2,
    "high" => 3,
    "very high" => 4,
  }
   
  def destination_type_enum
    ['men', 'women', 'family', 'concession']
  end
  
  def self.nearest_to_section(section)
      find(:first, :order => "ABS(closest_section - #{section}) ASC")
  end

  def self.current_wait_time_enum
    WAIT_TIMES
  end

  def self.destination_type_enum
    %w(men women concession family)
  end

end
