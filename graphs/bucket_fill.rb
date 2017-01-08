include Validator

class BucketFill
  COLOR = 'O'
  attr_accessor :base, :start_x, :start_y, :color

  validate :start_x, :start_y, integer: true, positive: true, presence: true
  validate :color, length: 1

  validate_on_canvas [:start_x, :start_y]

  def initialize(base, *arg)
    @base = base
    @start_x, @start_y = arg[0, 2]
    @color = arg[2] || COLOR
  end

  def draw
    mark(start_x, start_y)
    base
  end

  def mark(x, y)
    if base[y] && base[y][x] && base[y][x] == ' '
      base[y][x] = color
      mark(x + 1, y)
      mark(x - 1, y)
      mark(x, y + 1)
      mark(x, y - 1)
    end
  end
end