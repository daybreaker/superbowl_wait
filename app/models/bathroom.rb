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

class Bathroom < ActiveRecord::Base
  attr_accessible :address1, :address2, :bathroom_privacy, :bathroom_type, :city, :lat, :long, :name, :state, :zip, :tp_quality, :cost, :notes
  has_many :ratings
  
  geocoded_by :address, :latitude  => :lat, :longitude => :long 
  after_validation :geocode  # auto-fetch address

  TYPES = %w(home business public)

  def free?
    cost == "0"
  end

  def address
  [address1, address2, city, state, zip].compact.join(', ')
  end

end
