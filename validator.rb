require_relative 'argument_invalid_error'

module Validator

  def validate_attributes(*attributes, validation)
    attributes.each do |attr|
      define_method("validate_#{attr}!") do
        humanized_attr = attr.to_s.gsub('_', ' ')
        if validation[:presence]
          raise ArgumentInvalidError.new("#{self.class}: #{humanized_attr} is missing") unless self.send(attr)
        end

        if validation[:integer]
          raise ArgumentInvalidError.new("#{self.class}: '#{self.send(attr)}' is not a valid #{humanized_attr}") unless self.send(attr).is_a?(Integer)
        end

        if validation[:positive]
          raise ArgumentInvalidError.new("#{self.class}: '#{self.send(attr)}' is not a valid #{humanized_attr}") unless self.send(attr) > 0
        end

        if validation[:length]
          raise ArgumentInvalidError.new("#{self.class}: '#{self.send(attr)}' is too long for #{humanized_attr}") unless self.send(attr).length <= validation[:length]
        end
      end
    end
  end

  def validate_on_canvas(*coordinates)
    define_method('validate_on_canvas!') do
      if self.respond_to?(:base) && self.base
        coordinates.each do |coordinate|
          x, y = coordinate.map{|c| self.send(c)}
          max_x = self.base.first.length - 2
          max_y = self.base.length - 2
          if x > max_x || y > max_y
            raise ArgumentInvalidError.new("#{self.class}: (#{x}, #{y}) is out of canvas '#{max_x}, #{max_y}'")
          end
        end
      else
        raise ArgumentInvalidError.new("#{self.class}: please draw a canvas first")
      end
    end
  end

  def valid!
    self.validate! if self.respond_to?(:validate!)
    self.class.instance_methods(false).each do |method|
      if method.to_s.include?('validate_')
        self.send(method)
      end
    end
    true
  end
end