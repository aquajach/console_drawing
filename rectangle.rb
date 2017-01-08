class Rectangle < Line
  def cover?(x, y)
    (x - start_x) * (x - end_x) <= 0 &&
        (y - start_y) * (y - end_y) <= 0 &&
        (x == start_x || x == end_x || y == start_y || y == end_y)
  end
end