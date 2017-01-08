describe Validator do
  it 'checks presence' do
    expect do
      Canvas.new.valid!
    end.to raise_error(ArgumentInvalidError, 'Canvas: width is missing')
  end

  it 'checks positive' do
    expect do
      Canvas.new(0, 3).valid!
    end.to raise_error(ArgumentInvalidError, "Canvas: '0' is not a valid width")
  end

  it 'checks integer' do
    expect do
      Canvas.new('width', 3).valid!
    end.to raise_error(ArgumentInvalidError, "Canvas: 'width' is not a valid width")
  end

  it 'checks length' do
    expect do
      BucketFill.new(Canvas.new(4, 4).draw, 1, 3, 'OO').valid!
    end.to raise_error(ArgumentInvalidError, "BucketFill: 'OO' is too long for color")
  end

  it 'checks in canvas for line' do
    expect do
      Line.new(Canvas.new(4, 4).draw, 1, 1, 1, 5).valid!
    end.to raise_error(ArgumentInvalidError, "Line: '1, 5' is out of canvas '4, 4'")
  end
end