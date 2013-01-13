module DestinationHelper
  def scale_x(point)
    # 15px to offset width and center image
    point * Section::SUPERDOME_IMAGE[:width] / 100 - 15
  end
  
  def scale_y(point)
    # 15px to offset height and center image
    point * Section::SUPERDOME_IMAGE[:height] / 100 - 15
  end
end
