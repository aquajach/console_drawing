require 'stringio'

module IOHelper
  def spec_io(in_str = nil)
    old_stdin, old_stdout = $stdin, $stdout
    $stdin = StringIO.new(in_str) if in_str
    $stdout = StringIO.new
    yield
    $stdout.string
  ensure
    $stdin, $stdout = old_stdin, old_stdout
  end
end