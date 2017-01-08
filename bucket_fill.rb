require_relative 'validator'
include Validator

class BucketFill
  attr_accessor :base, :start_x, :start_y, :pen

  validate :start_x, :start_y, integer: true, presence: true

  def initialize(base, *arg)
    @base = base
    @start_x, @start_y, @pen = arg[0, 3]
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