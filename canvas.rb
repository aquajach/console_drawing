class Canvas
  attr_reader :width, :height

  def initialize(*arg)
    @width = arg[0]
    @height = arg[1]
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