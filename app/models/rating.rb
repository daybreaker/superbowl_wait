class Rating < ActiveRecord::Base
  belongs_to :bathroom
  attr_accessible :cleanliness, :comfort, :location, :overall, :tp
end
