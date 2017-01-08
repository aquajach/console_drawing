require 'set'
require_relative 'canvas'
require_relative 'line'
require_relative 'rectangle'
require_relative 'bucket_fill'
require_relative 'argument_invalid_error'

class Drawing
  attr_accessor :result, :active, :error

  def initialize
    @active = true
  end

  def run(input)
    instruction = input.split(' ')
    command = instruction.shift
    instruction = instruction.map{|argument| argument =~ /\A\d+\z/ ? argument.to_i : argument}
    graph = nil
    case command
      when 'Q'
        self.active = false
      when 'C'
        graph = Canvas.new(*instruction)
      when 'L'
        graph = Line.new(self.result, *instruction)
      when 'R'
        graph = Rectangle.new(self.result, *instruction)
      when 'B'
        graph = BucketFill.new(self.result, *instruction)
      else
        self.error = "#{command} is an undefined command" and return
    end
    begin
      self.result = graph.draw if graph && graph.valid!
      self.error = nil
    rescue ArgumentInvalidError => e
      self.error = e.message
    end
  end
end

