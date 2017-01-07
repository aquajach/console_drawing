require_relative '../canvas'

describe Canvas do
  it 'draws a rectangle' do
    output = spec_io do
      described_class.new(width: 3, height: 4)
    end
    expect(output).to eql "---\n| |\n| |\n---\n"
  end
end
