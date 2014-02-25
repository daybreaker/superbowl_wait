# == Schema Information
#
# Table name: bathrooms
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  address1         :string(255)
#  address2         :string(255)
#  city             :string(255)
#  state            :string(255)
#  zip              :string(255)
#  lat              :string(255)
#  long             :string(255)
#  bathroom_type    :string(255)
#  bathroom_privacy :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  tp_quality       :string(255)
#  cost             :string(255)
#  notes            :text
#

require 'test_helper'

class BathroomTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
