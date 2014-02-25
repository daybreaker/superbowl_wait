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

require 'test_helper'

class DestinationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
