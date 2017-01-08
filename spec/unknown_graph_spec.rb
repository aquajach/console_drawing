describe UnknownGraph do
  describe 'valid!' do
    it 'raise argument invalid error' do
      graph = described_class.new('W')
      expect{graph.valid!}.to raise_error(ArgumentInvalidError, "'W' command is undefined")
    end
  end
end