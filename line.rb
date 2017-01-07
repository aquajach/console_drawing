class Line
  SIGN = 'X'
  attr_reader :base, :start_x, :start_y, :end_x, :end_y

  def initialize(base, *arg)
    @base = base
    @start_x, @start_y, @end_x, @end_y = arg[0, 4]
  end

  def draw
    base.map.with_index do |row, y|
      row.map.with_index do |point, x|
        if x != 0 && y != 0 && y != (base.size - 1) && x != (row.size - 1)
          next SIGN if self.cover?(x, y)
        end
        point
      end
    end
  end

  def cover?(x, y)
    (x == start_x && y == start_y) ||
        (x == end_x && y == end_y) ||
        (x > start_x && x < end_x && ((y - start_y) * 1.0 / (x - start_x)) == ((y - end_y) * 1.0 / (x - end_x)))
  end
end