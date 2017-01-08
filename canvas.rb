require_relative 'validator'
include Validator

class Canvas
  attr_reader :width, :height

  validate :width, :height, integer: true, positive: true, presence: true

  def initialize(*arg)
    @width, @height = arg[0, 2]
  end

  def draw
    result = []
    result << ('-' * (width + 2)).chars
    height.times do
      result << ('|' << ' ' * width << '|').chars
    end
    result << ('-' * (width + 2)).chars
  end
end