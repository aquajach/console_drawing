describe BucketFill do
  describe '#draw' do
    it 'draws a line' do
      base = Line.new(Canvas.new(4, 4).draw, 1, 2, 4, 2).draw
      bucket_fill = described_class.new(
          base, 1, 3, 'C'
      )
      expect(bucket_fill.draw).to eql [
                                   ['-', '-', '-', '-', '-', '-'],
                                   ['|', ' ', ' ', ' ', ' ', '|'],
                                   ['|', 'x', 'x', 'x', 'x', '|'],
                                   ['|', 'C', 'C', 'C', 'C', '|'],
                                   ['|', 'C', 'C', 'C', 'C', '|'],
                                   ['-', '-', '-', '-', '-', '-']
                               ]
    end
  end
end