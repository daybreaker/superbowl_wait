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

class Section < ActiveRecord::Base
  attr_accessible :section_number, :x, :y, :chunk

 

end
