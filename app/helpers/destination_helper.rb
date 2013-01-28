module DestinationHelper
  def scale_x(point)
    # image x,y based on 100x100 grid. This lets us scale it automatically + a little fudge factor
    point.to_f * Destination::IMAGE[:width] / 100 if point
  end
  
  def scale_y(point)
    # image x,y based on 100x100 grid. This lets us scale it automatically + a little fudge factor
    point.to_f * Destination::IMAGE[:height] / 100 if point
  end
  
  def classify(destination)
    status = destination.stale? ? "stale" : Destination::STATUSES[destination.current_status.to_s]
    "destination #{destination.lot_size}_#{destination.destination_type} #{status}"
  end
  
  def get_content(destination)
    if !destination.stale?
      destination.current_status == Destination::STATUSES.key("high") ? "X" : "P"
    else
      "?"
    end 
  end
  
  def gmap_link(place)
    param = place.gsub(/[\s\n\r\t]/,"+").gsub(/\+\+/,'+')
    "https://maps.google.com/maps?q=#{param}"
  end
end
