class Chunk < ActiveRecord::Base
  attr_accessible :chunk_number, :next_chunk, :prev_chunk, :sections
  
  has_and_belongs_to_many :sections
  
  
  def average_wait_time
    dests = sections.flat_map(&:destinations)
    dests.sum{|x| Destination::WAIT_TIMES[x.current_wait_time] }.to_f / dests.count.to_f
  end

end
