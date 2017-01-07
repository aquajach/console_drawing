require_relative 'drawing'


def draw
  drawing = Drawing.new

  loop do
    input = $stdin.gets.chomp
    drawing.run(input)
    break unless drawing.active
  end
end