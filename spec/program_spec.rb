require_relative '../program'

describe Program do
  it 'runs drawing until input is Q' do
    output = spec_io("C 4 4\nL 1 2 3 4\nQ\n") do
      described_class.start
    end

    expect(output.gsub("enter command:\n", '')).to eql("------\n|    |\n|    |\n|    |\n|    |\n------\n------\n|    |\n|X   |\n| X  |\n|  X |\n------\n")
  end

  it 'prints error message if drawing has errors' do
    output = spec_io("C 1 1\nW\nQ\n") do
      described_class.start
    end

    expect(output.gsub("enter command:\n", '')).to eql("---\n| |\n---\nW is an undefined command\n")
  end

end