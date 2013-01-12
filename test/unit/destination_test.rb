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

require 'test_helper'

class DestinationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
