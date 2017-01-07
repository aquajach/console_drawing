require_relative '../drawing'

describe Drawing do
  describe 'For canvas' do
    it 'initializes canvas instance' do
      drawing = Drawing.new
      expect(Canvas).to receive(:new).with(width: 1, height: 2)
      drawing.run 'C 1 2'
      drawing.instructions = ['C 1 2']
    end
  end
end
