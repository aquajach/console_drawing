require_relative 'validator'
include Validator

class BucketFill
  PEN = 'O'
  attr_accessor :base, :start_x, :start_y, :pen

  validate :start_x, :start_y, integer: true, positive: true, presence: true
  validate :pen, length: 1

  validate_on_canvas [:start_x, :start_y]

  def initialize(base, *arg)
    @base = base
    @start_x, @start_y = arg[0, 2]
    @pen = arg[2] || PEN
  end

  def draw
    mark(start_x, start_y)
    base
  end

  def mark(x, y)
    if base[y] && base[y][x] && base[y][x] == ' '
      base[y][x] = pen
      mark(x + 1, y)
      mark(x - 1, y)
      mark(x, y + 1)
      mark(x, y - 1)
    end
  end
end