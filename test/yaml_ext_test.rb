require 'test/unit'
require File.dirname(__FILE__) + '/../lib/yaml_ext'
require File.dirname(__FILE__) + '/types'

class TestYamlHelper < Test::Unit::TestCase
    # Testing transient attribute
    def test_basic
        obj = Basic.new
        obj.a = 2
        s = obj.to_yaml
        obj2 = YAML::load(s)
        assert_equal obj.a, obj2.a
    end
  
    def check_transient_square obj
        obj.width = 2
        obj.height = 3
        obj.area = 5

        s = obj.to_yaml
        obj2 = YAML::load(s)
        assert_equal obj.width, obj2.width
        assert_equal obj.height, obj2.height
    
        obj2
    end
  
    def test_transient_attribute
        obj2 = check_transient_square Square.new
        assert_nil obj2.area
    end
  
    def test_transient_multi_attribute
        obj2 = check_transient_square Square2.new
        assert_nil obj2.area
        assert_nil obj2.circumference
    end
  
    def test_transient_attribute_inherited
        obj = SuperSquare.new
        obj.width = 2
        obj.height = 3
        obj.bonus = "WINNER"
        obj.calc_area
        obj2 = check_transient_square obj

        assert_equal obj.bonus, obj2.bonus
        assert_nil obj2.area
    end
end
