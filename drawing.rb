require_relative 'canvas'

class Drawing
  attr_accessor :instructions, :active

  def initialize
    @instructions = []
    @active = true
  end

  def run(input)
    @instructions << input
    instruction = input.split(' ')

    command = instruction.shift
    case command
      when 'Q'
        self.active = false
      when 'C'
        Canvas.new(width: instruction[0].to_i, height: instruction[1].to_i)
    end
  end
end

