require_relative 'argument_invalid_error'

module Validator

  def validate(*attributes, validation)
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
      end
    end
  end

  def validate_on_line(point_1, point_2)
    define_method('validate_on_line!') do
      x_1, y_1 = point_1.map{|p| self.send(p)}
      x_2, y_2 = point_2.map{|p| self.send(p)}
      if x_1 != x_2 && y_1 != y_2
        raise ArgumentInvalidError.new("#{self.class}: (#{x_1}, #{y_1}) and (#{x_2}, #{y_2}) do not lie on a line")
      end
    end
  end

  def valid!
    self.class.instance_methods(false).each do |method|
      if method.to_s.include?('validate_')
        self.send(method)
      end
    end
    true
  end
end