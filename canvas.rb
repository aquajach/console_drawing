class Canvas
  def initialize(width:, height:)
    puts '-'*width
    (height - 2).times do
      puts ('|' << ' '*(width - 2) << '|')
    end
    puts '-'*width
  end
end