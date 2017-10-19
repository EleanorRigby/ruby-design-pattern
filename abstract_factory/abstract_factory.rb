class Color
  def fill
    raise NotImplementedError
  end
end

class Blue < Color
  def fill
    puts 'fill with blue color'
  end
end

class Red < Color
  def fill
    puts 'fill with red color'
  end
end

class Shape
  def draw
    raise NotImplementedError
  end
end

class Rectangle < Shape
  def draw
    puts 'draw rectangle shape'
  end
end

class Circle < Shape
  def draw
    puts 'draw circle shape'
  end
end

class AbstractFactory
  def get_color
    raise NotImplementedError
  end

  def get_shape
    raise NotImplementedError
  end
end

class BlueRectangleFactory < AbstractFactory
  def get_shape
    Rectangle.new
  end
  
  def get_color
    Blue.new
  end
end

class RedCircleFactory < AbstractFactory
  def get_shape
    Circle.new
  end

  def get_color
    Red.new
  end
end

class ColoredShapeFactory
  def get_factory(type)
    if %w(BlueRectangle RedCircle).include? type
      self.class.const_get("#{type}Factory").new
    end
  end
end

if __FILE__ == $0
  colored_shape_factory = ColoredShapeFactory.new

  blue_rectangle_factory = colored_shape_factory.get_factory('BlueRectangle')
  blue_rectangle_factory.get_shape.draw
  blue_rectangle_factory.get_color.fill

  red_circle_factory = colored_shape_factory.get_factory('RedCircle')
  red_circle_factory.get_shape.draw
  red_circle_factory.get_color.fill
end
