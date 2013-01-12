# == Schema Information
#
# Table name: sections
#
#  id             :integer          not null, primary key
#  section_number :integer
#  x              :integer
#  y              :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  chunk          :string(255)
#

require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
