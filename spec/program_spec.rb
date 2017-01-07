require_relative '../program'

describe 'app' do
  it 'runs drawing until input is Q' do
    expect_any_instance_of(Drawing).to receive(:run).exactly(3).times.and_return(
        [['-', '-', '-'], ['|', ' ', '|'], ['|', ' ', '|'], ['-', '-', '-']],
        [['-', '-', '-'], ['|', 'X', '|'], ['|', 'X', '|'], ['-', '-', '-']],
        nil
    )

    output = spec_io("1\n2\nQ\n") do
      Program.new.start
    end

    expect(output.gsub("enter command:\n", '')).to eql("---\n| |\n| |\n---\n---\n|X|\n|X|\n---\n")
  end

end