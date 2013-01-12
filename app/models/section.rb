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
  attr_accessible :section_number, :x, :y
  
  has_and_belongs_to_many :chunks
  has_many :destinations, :foreign_key => :closest_section, :primary_key => :section_number

  def chunk_with_lowest_wait
    chunks.min{ |x,y| x.average_wait_time <=> y.average_wait_time }
  end
end
