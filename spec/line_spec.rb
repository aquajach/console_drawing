require_relative '../line'

describe Line do

  describe '#cover?' do
    it 'returns if the line covers a point' do
      line = described_class.new(
          Canvas.new(20, 20).draw,
          1, 5, 10, 14
      )
      expect(line.cover?(1, 5)).to be true
      expect(line.cover?(10, 14)).to be true
      expect(line.cover?(2, 5)).to be false
      expect(line.cover?(10, 15)).to be false
      expect(line.cover?(5, 9)).to be true
      expect(line.cover?(5, 10)).to be false
    end
  end

  describe '#draw' do
    it 'draws a line' do
      line = described_class.new(
          Canvas.new(4, 4).draw,
          1, 1, 3, 3
      )
      expect(line.draw).to eql [
                                   ['-', '-', '-', '-', '-', '-'],
                                   ['|', 'X', ' ', ' ', ' ', '|'],
                                   ['|', ' ', 'X', ' ', ' ', '|'],
                                   ['|', ' ', ' ', 'X', ' ', '|'],
                                   ['|', ' ', ' ', ' ', ' ', '|'],
                                   ['-', '-', '-', '-', '-', '-']
      ]
    end
  end
end
