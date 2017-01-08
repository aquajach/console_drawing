describe BucketFill do
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