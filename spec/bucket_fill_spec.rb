require_relative '../bucket_fill'
require_relative '../line'
require_relative '../canvas'

describe BucketFill do
  # describe '#cover?' do
  #   it 'returns if the line covers a point' do
  #     line = described_class.new(
  #         Canvas.new(20, 20).draw,
  #         1, 5, 10, 14
  #     )
  #     expect(line.cover?(1, 5)).to be true
  #     expect(line.cover?(10, 14)).to be true
  #     expect(line.cover?(2, 5)).to be false
  #     expect(line.cover?(10, 15)).to be false
  #     expect(line.cover?(5, 9)).to be true
  #     expect(line.cover?(5, 10)).to be false
  #   end
  # end

  describe '#draw' do
    it 'draws a line' do
      base = Line.new(Canvas.new(4, 4).draw, 1, 1, 4, 4).draw
      bucket_fill = described_class.new(
          base, 1, 2, 'C'
      )
      expect(bucket_fill.draw).to eql [
                                   ['-', '-', '-', '-', '-', '-'],
                                   ['|', 'X', ' ', ' ', ' ', '|'],
                                   ['|', 'C', 'X', ' ', ' ', '|'],
                                   ['|', 'C', 'C', 'X', ' ', '|'],
                                   ['|', 'C', 'C', 'C', 'X', '|'],
                                   ['-', '-', '-', '-', '-', '-']
                               ]
    end
  end
end