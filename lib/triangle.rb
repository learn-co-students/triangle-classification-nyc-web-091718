require 'pry'
class Triangle
  # write code here
  attr_accessor :s1,:s2,:s3,:type,:sides

  def initialize(s1,s2,s3)
    @s1 = s1
    @s2 = s2
    @s3 = s3
    @type = ""
    @sides = [s1,s2,s3]
  end
  def kind
    if self.s1 <= 0 || self.s2 <= 0 || self.s3 <= 0
      raise TriangleError
    end

    if self.sides.sort[0] + self.sides.sort[1] <= self.sides.sort[2]
      raise TriangleError
    end

    if self.s1 == self.s2 && self.s2 == self.s3
      :equilateral
    elsif self.s1 == self.s2 || self.s1 == self.s3 || self.s2 == self.s3
      :isosceles
    else
      :scalene
    end

  end

  class TriangleError < StandardError

  end

end
