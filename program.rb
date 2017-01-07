require_relative 'drawing'

class Program
  attr_accessor :drawing

  def initialize
    @drawing = Drawing.new
  end

  def start
    loop do
      puts 'enter command:'
      input = $stdin.gets
      break if input.nil?
      result = @drawing.run(input.chomp)
      result.map do |row|
        puts row.join
      end if result
      break unless drawing.active
    end
  end
end