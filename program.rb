require_relative 'drawing'

class Program
  def self.start
    drawing = Drawing.new
    loop do
      puts 'enter command:'
      input = $stdin.gets
      break if input.nil?
      drawing.run(input.chomp)
      if error = drawing.error
        puts error
      elsif !drawing.active
        break
      elsif result = drawing.result
        result.map do |row|
          puts row.join
        end
      end
    end
  end
end