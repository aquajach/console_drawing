require_relative 'canvas'
require_relative 'line'
require_relative 'rectangle'
require_relative 'bucket_fill'
require_relative 'unknown_graph'
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
    graph = graph(command, instruction)
    begin
      self.result = graph.draw if graph && graph.valid!
    rescue ArgumentInvalidError => e
      self.error = e.message
    end
  end

  def graph(command, instruction)
    case command
      when 'Q'
        self.active = false
      when 'C'
        Canvas.new(*instruction)
      when 'L'
        Line.new(self.result, *instruction)
      when 'R'
        Rectangle.new(self.result, *instruction)
      when 'B'
        BucketFill.new(self.result, *instruction)
      else
        UnknownGraph.new(command)
    end
  end
end

