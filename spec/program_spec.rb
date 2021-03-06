describe Program do
  it 'runs drawing until input is Q' do
    output = spec_io("C 4 4\nL 1 2 1 4\nQ\n") do
      described_class.start
    end

    expect(output.gsub("enter command:\n", '')).to eql("------\n|    |\n|    |\n|    |\n|    |\n------\n------\n|    |\n|x   |\n|x   |\n|x   |\n------\n")
  end

  it 'prints error message if drawing has errors' do
    output = spec_io("C 1 1\nW\nQ\n") do
      described_class.start
    end

    expect(output.gsub("enter command:\n", '')).to eql("---\n| |\n---\n'W' command is undefined\n")
  end

end