class Rectangle < LineGraph

  validate_attributes :start_x, :start_y, :end_x, :end_y, integer: true, positive: true, presence: true

  validate_on_canvas [:start_x, :start_y], [:end_x, :end_y]

  def cover?(x, y)
    (x - start_x) * (x - end_x) <= 0 &&
        (y - start_y) * (y - end_y) <= 0 &&
        (x == start_x || x == end_x || y == start_y || y == end_y)
  end

  def validate!
    if start_x >= end_x || start_y >= end_y
      raise ArgumentInvalidError.new("#{self.class}: (#{start_x}, #{start_y}) and (#{end_x}, #{end_y}) can not draw a rectangle as top the left corner and bottom right corner respectively")
    end
  end
end