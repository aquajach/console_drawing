describe Line do
  describe '#cover?' do
    it 'returns if the vertical/horizontal line covers a point' do
      line = described_class.new(
          Canvas.new(20, 20).draw,
          1, 5, 1, 14
      )
      expect(line.cover?(1, 9)).to be true
      expect(line.cover?(1, 15)).to be false
    end
  end

  describe '#draw' do
    it 'marks a line' do
      line = described_class.new(
          Canvas.new(4, 4).draw,
          1, 1, 1, 3
      )
      expect(line.draw).to eql [
                                   ['-', '-', '-', '-', '-', '-'],
                                   ['|', 'x', ' ', ' ', ' ', '|'],
                                   ['|', 'x', ' ', ' ', ' ', '|'],
                                   ['|', 'x', ' ', ' ', ' ', '|'],
                                   ['|', ' ', ' ', ' ', ' ', '|'],
                                   ['-', '-', '-', '-', '-', '-']
      ]
    end

    it 'checks if start and end points lie on line' do
      expect do
        Line.new(Canvas.new(4, 4).draw, 1, 1, 2, 2).valid!
      end.to raise_error(ArgumentInvalidError, 'Line: (1, 1) and (2, 2) do not lie on a line')
    end
  end
end
