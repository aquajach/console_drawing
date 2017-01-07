require_relative '../app'

describe 'app' do
  it 'runs drawing until input is Q' do
    expect_any_instance_of(Drawing).to receive(:run).exactly(3).times.and_call_original
    spec_io("1\n2\nQ\n") do
      draw
    end
  end
end