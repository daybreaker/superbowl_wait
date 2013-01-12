class Destination < ActiveRecord::Base
  attr_accessible :closest_section, :current_report_time, :current_wait_time, :lat, :long, :type
end
