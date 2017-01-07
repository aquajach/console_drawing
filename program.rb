require_relative 'drawing'

class Program
  def self.start
    drawing = Drawing.new
    loop do
      puts 'enter command:'
      input = $stdin.gets
      break if input.nil?
      result = drawing.run(input.chomp)
      result.map do |row|
        puts row.join
      end if result
      break unless drawing.active
    end
  end
end