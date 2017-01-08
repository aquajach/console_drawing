require_relative 'argument_invalid_error'

class UnknownGraph
  attr_reader :command

  def initialize(command)
    @command = command
  end

  def valid!
    raise ArgumentInvalidError.new("'#{command}' command is undefined")
  end
end