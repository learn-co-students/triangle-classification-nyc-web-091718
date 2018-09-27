require 'pry'

class Triangle
  # write code here
  attr_accessor :side1, :side2, :side3, :type

  def initialize(side1, side2, side3)
      @side1 = side1
      @side2 = side2
      @side3 = side3
  end

  def sides
    sides = []
    sides << self.side1
    sides << self.side2
    sides << self.side3
    sides.sort!
  end

  def side_mode
    self.sides.uniq.map{|i| sides.count(i)}.max
    # binding.pry
  end

  def kind
    if self.sides[2] >= self.sides[0]+self.sides[1] || self.sides[0] <= 0
        raise TriangleError
    else
      if self.side_mode == 3
        # self.side1 == self.side2 && self.side2 == self.side3
        self.type = :equilateral
      elsif self.side_mode == 2
        # .max_by {|i| sides.count(i)} == 2
        self.type = :isosceles
      else
        # self.side1 != self.side2 && self.side2 != self.side3 && self.side1 != self.side3
        self.type = :scalene
      end
    end
    self.type
  end

  class TriangleError < StandardError
    def message
      "Your triangle is invalid! The sums of the lengths of the two shorter sides must be longer than the longest side!"
    end
  end
# binding.pry
end

tri = Triangle.new(1,1,1)
