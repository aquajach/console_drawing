describe Rectangle do
  describe '#cover?' do
    it 'returns if the line covers a point' do
      rectangle = described_class.new(
          Canvas.new(20, 20).draw,
          1, 5, 11, 19
      )
      expect(rectangle.cover?(1, 5)).to be true
      expect(rectangle.cover?(11, 19)).to be true
      expect(rectangle.cover?(2, 5)).to be true
      expect(rectangle.cover?(11, 15)).to be true
      expect(rectangle.cover?(12, 9)).to be false
      expect(rectangle.cover?(5, 10)).to be false
    end
  end

  describe '#draw' do
    it 'draws a rectangle' do
      rectangle = described_class.new(
          Canvas.new(4, 4).draw,
          1, 1, 3, 3
      )
      expect(rectangle.valid!).to be true
      expect(rectangle.draw).to eql [
                                   ['-', '-', '-', '-', '-', '-'],
                                   ['|', 'x', 'x', 'x', ' ', '|'],
                                   ['|', 'x', ' ', 'x', ' ', '|'],
                                   ['|', 'x', 'x', 'x', ' ', '|'],
                                   ['|', ' ', ' ', ' ', ' ', '|'],
                                   ['-', '-', '-', '-', '-', '-']
                               ]
    end

    it 'checks if possible to draw rectangle with a left top corner and a right bottom corner' do
      expect do
        described_class.new(Canvas.new(4, 4).draw, 1, 1, 1, 2).valid!
      end.to raise_error(ArgumentInvalidError, 'Rectangle: (1, 1) and (1, 2) can not draw a rectangle as top the left corner and bottom right corner respectively')
    end
  end
end