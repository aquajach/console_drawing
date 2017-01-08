require_relative 'validator'
include Validator

class Line
  PEN = 'X'

  attr_reader :base, :start_x, :start_y, :end_x, :end_y

  validate :start_x, :start_y, :end_x, :end_y, integer: true, positive: true, presence: true

  validate_on_canvas [:start_x, :start_y], [:end_x, :end_y]

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

  def cover?(x, y)
    (x - start_x) * (x - end_x) <= 0 &&
    (y - start_y) * (y - end_y) <= 0 &&
    ((x == start_x && x == end_x) || (y == start_y && y == end_y) || ((x - start_x) == (y - start_y)))
  end
end