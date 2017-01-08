require 'set'
require_relative 'canvas'
require_relative 'line'
require_relative 'rectangle'

class Drawing
  attr_accessor :result, :active

  def initialize
    @result = []
    @active = true
  end

  def run(input)
    instruction = input.split(' ')

    command = instruction.shift
    instruction = instruction.map(&:to_i)
    case command
      when 'Q'
        self.active = false
      when 'C'
        self.result = Canvas.new(*instruction).draw
      when 'L'
        self.result = Line.new(self.result, *instruction).draw
      when 'R'
        self.result = Rectangle.new(self.result, *instruction).draw
    end
  end
end

