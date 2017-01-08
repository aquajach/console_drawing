class Line < LineGraph

  validate :start_x, :start_y, :end_x, :end_y, integer: true, positive: true, presence: true

  validate_on_canvas [:start_x, :start_y], [:end_x, :end_y]

  validate_on_line [:start_x, :start_y], [:end_x, :end_y]

  def cover?(x, y)
    (x - start_x) * (x - end_x) <= 0 &&
    (y - start_y) * (y - end_y) <= 0 &&
    ((x == start_x && x == end_x) || (y == start_y && y == end_y))
  end
end