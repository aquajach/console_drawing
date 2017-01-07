require_relative '../canvas'

describe Canvas do
  it 'draws a rectangle' do
    canvas = described_class.new(1, 2)
    expect(canvas.draw).to eql [['-', '-', '-'], ['|', ' ', '|'], ['|', ' ', '|'], ['-', '-', '-']]
  end
end
