module DestinationHelper
  def scale_x(point)
    # image x,y based on 100x100 grid. This lets us scale it automatically + a little fudge factor
    point * Section::SUPERDOME_IMAGE[:width] / 100 + 70
  end
  
  def scale_y(point)
    # image x,y based on 100x100 grid. This lets us scale it automatically + a little fudge factor
    point * Section::SUPERDOME_IMAGE[:height] / 100 + 80
  end
  
  def classify(destination)
    destination.current_wait_time ||= 'low'
    "destination #{destination.destination_type} #{destination.current_wait_time.gsub(' ','_')}"
  end
end
