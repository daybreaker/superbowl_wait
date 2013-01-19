# == Schema Information
#
# Table name: destinations
#
#  unique_id           :string(255)
#  destination_type    :string(255)
#  current_status      :string(255)
#  current_report_time :datetime
#  lat                 :integer
#  long                :integer
#  name                :string(255)
#  description         :text
#  source              :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Destination < ActiveRecord::Base
  attr_accessible :unique_id, :current_report_time, :current_status, :lat, :long, :destination_type, :name, :description, :source, :updates
  has_many :updates
end
