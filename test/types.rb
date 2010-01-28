class Basic
    attr_accessor :a
end

class Square
    attr_accessor :width, :height, :area
    transient :area
  
    def calc_area
        @area = @width * @height
    end
end

class SuperSquare < Square
    attr_accessor :bonus
end

class Square2
    attr_accessor :width, :height, :area, :circumference
    transient :area, :circumference

    def calc_circumference
        @cirumference = 2 * (@width + @height)
    end
end

class Square3
    attr_accessor :width, :height, :area
    transient :area
end

class SquareCyclic
    def initialize
        @me = self
    end
end
