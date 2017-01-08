require_relative '../canvas'
require_relative '../argument_invalid_error'

describe Canvas do
  it 'draws a rectangle' do
    canvas = described_class.new(1, 2)
    expect(canvas.draw).to eql [['-', '-', '-'], ['|', ' ', '|'], ['|', ' ', '|'], ['-', '-', '-']]
  end

  it 'raises argument invalid error if width is missing or invalid' do
    expect do
      described_class.new.valid!
    end.to raise_error(ArgumentInvalidError, 'Canvas: width is missing')
    expect do
      described_class.new('width', 3).valid!
    end.to raise_error(ArgumentInvalidError, "Canvas: 'width' is not an integer for width")
    expect do
      described_class.new(1.2, 3).valid!
    end.to raise_error(ArgumentInvalidError, "Canvas: '1.2' is not an integer for width")
  end

  it 'raises argument invalid error if height is missing or invalid' do
    expect do
      described_class.new(1).valid!
    end.to raise_error(ArgumentInvalidError, 'Canvas: height is missing')
    expect do
      described_class.new(1, 'height').valid!
    end.to raise_error(ArgumentInvalidError, "Canvas: 'height' is not an integer for height")
    expect do
      described_class.new(1, 3.0).valid!
    end.to raise_error(ArgumentInvalidError, "Canvas: '3.0' is not an integer for height")
  end
end
