require 'set'
require_relative 'canvas'
require_relative 'line'
require_relative 'rectangle'
require_relative 'bucket_fill'

class Drawing
  attr_accessor :result, :active

  def initialize
    @result = []
    @active = true
  end

  def run(input)
    instruction = input.split(' ')

    command = instruction.shift
    instruction = instruction.map{|argument| argument =~ /\A\d+\z/ ? argument.to_i : argument}
    case command
      when 'Q'
        self.active = false
      when 'C'
        self.result = Canvas.new(*instruction).draw
      when 'L'
        self.result = Line.new(self.result, *instruction).draw
      when 'R'
        self.result = Rectangle.new(self.result, *instruction).draw
      when 'B'
        self.result = BucketFill.new(self.result, *instruction).draw
    end
  end
end

