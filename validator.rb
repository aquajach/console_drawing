require_relative 'argument_invalid_error'

module Validator

  def validate(*attributes, validation)
    define_method('valid!') do
      attributes.each do |attr|
        if validation[:presence]
          raise ArgumentInvalidError.new("#{self.class}: #{attr} is missing") unless self.send(attr)
        end

        if validation[:integer]
          raise ArgumentInvalidError.new("#{self.class}: '#{self.send(attr)}' is not an integer for #{attr}") unless self.send(attr).is_a?(Integer)
        end
        true
      end
    end
  end
end