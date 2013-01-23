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
    destination.current_status ||= 'low'
    "destination #{destination.lot_size}_#{destination.destination_type} #{Destination::STATUSES[destination.current_status.to_s]}"
  end
end
