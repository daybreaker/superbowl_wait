# == Schema Information
#
# Table name: ratings
#
#  id          :integer          not null, primary key
#  overall     :integer
#  cleanliness :integer
#  comfort     :integer
#  tp          :integer
#  location    :integer
#  bathroom_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Rating < ActiveRecord::Base
  belongs_to :bathroom
  attr_accessible :cleanliness, :comfort, :location, :overall, :tp
end
