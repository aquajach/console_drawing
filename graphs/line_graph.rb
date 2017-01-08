class LineGraph
  include Validator

  PEN = 'x'

  attr_reader :base, :start_x, :start_y, :end_x, :end_y

  def initialize(base, *arg)
    @base = base
    @start_x, @start_y, @end_x, @end_y = arg[0, 4]
  end

  def draw
    base.map.with_index do |row, y|
      row.map.with_index do |point, x|
        if x != 0 && y != 0 && y != (base.size - 1) && x != (row.size - 1)
          next PEN if self.cover?(x, y)
        end
        point
      end
    end
  end
end