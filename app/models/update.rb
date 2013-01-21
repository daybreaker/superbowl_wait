# == Schema Information
#
# Table name: updates
#
#  id                    :integer          not null, primary key
#  destination_unique_id :integer
#  source                :string(255)
#  status                :string(255)
#  reported_at           :datetime
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class Update < ActiveRecord::Base
  attr_accessible :destination_id, :report_at, :status, :source
  belongs_to :destination
end
