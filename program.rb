require_relative 'drawing'

class Program
  def self.start
    drawing = Drawing.new
    loop do
      puts 'enter command:'
      input = $stdin.gets.chomp
      drawing.run(input)
      if !drawing.active
        break
      elsif error = drawing.error
        puts error
      elsif result = drawing.result
        result.map do |row|
          puts row.join
        end
      end
    end
  end
end