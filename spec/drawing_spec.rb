require_relative '../drawing'

describe Drawing do
  let(:drawing){Drawing.new}
  describe 'For canvas' do
    it 'initializes canvas instance' do
      expect(Canvas).to receive(:new).with(3, 4).and_call_original
      allow_any_instance_of(Canvas).to receive(:draw).and_return(['Canvas'])
      drawing.run 'C 3 4'
      expect(drawing.result).to eql ['Canvas']
    end
  end

  describe 'For line' do
    it 'initializes line instance' do
      drawing.result = ['Canvas']
      expect(Line).to receive(:new).with(['Canvas'], 1, 2, 3, 4).and_call_original
      allow_any_instance_of(Line).to receive(:draw).and_return(['Canvas with Line'])
      drawing.run 'L 1 2 3 4'
      expect(drawing.result).to eql ['Canvas with Line']
    end
  end
end
