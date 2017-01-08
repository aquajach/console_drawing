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
      allow_any_instance_of(Line).to receive(:valid!).and_return(true)
      expect(Line).to receive(:new).with(['Canvas'], 1, 2, 3, 4).and_call_original
      allow_any_instance_of(Line).to receive(:draw).and_return(['Canvas with Line'])
      drawing.run 'L 1 2 3 4'
      expect(drawing.result).to eql ['Canvas with Line']
    end
  end

  describe 'For Rectangle' do
    it 'initializes rectangle instance' do
      drawing.result = ['Canvas']
      allow_any_instance_of(Rectangle).to receive(:valid!).and_return(true)
      expect(Rectangle).to receive(:new).with(['Canvas'], 1, 2, 3, 4).and_call_original
      allow_any_instance_of(Rectangle).to receive(:draw).and_return(['Canvas with Rectangle'])
      drawing.run 'R 1 2 3 4'
      expect(drawing.result).to eql ['Canvas with Rectangle']
    end
  end

  describe 'For Rectangle' do
    it 'initializes rectangle instance' do
      drawing.result = ['Canvas']
      allow_any_instance_of(BucketFill).to receive(:valid!).and_return(true)
      expect(BucketFill).to receive(:new).with(['Canvas'], 1, 2, 'O').and_call_original
      allow_any_instance_of(BucketFill).to receive(:draw).and_return(['Canvas with Bucket Fill'])
      drawing.run 'B 1 2 O'
      expect(drawing.result).to eql ['Canvas with Bucket Fill']
    end
  end

  describe 'Undefined Command' do
    it 'assigns error to drawing but does not change previous result' do
      drawing.result = ['Previous Result']
      drawing.run 'W 1 2 O'
      expect(drawing.error).to eql "'W' command is undefined"
      expect(drawing.result).to eql ['Previous Result']
    end
  end

  describe 'Graph Error' do
    [Canvas, Line, Rectangle, BucketFill].each do |graph_class|
      it 'assigns error to drawing when graph is not valid' do
        drawing.result = ['Previous Result']
        allow_any_instance_of(graph_class).to receive(:valid!).and_raise(ArgumentInvalidError.new('Argument Error'))
        drawing.run "#{graph_class.to_s[0]} 1 2 3 4"
        expect(drawing.error).to eql 'Argument Error'
        expect(drawing.result).to eql ['Previous Result']
      end
    end
  end
end
