class Bathroom < ActiveRecord::Base
  attr_accessible :address1, :address2, :bathroom_privacy, :bathroom_type, :city, :lat, :long, :name, :state, :zip
  has_many :ratings
end
