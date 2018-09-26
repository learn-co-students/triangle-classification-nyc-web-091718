require 'pry'

class Triangle
  attr_accessor :side1, :side2, :side3, :kind

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    sides = [side1, side2, side3]

    sides.each_with_index do |side, index|
      raise TriangleError if (sides[index] >= (sides[(index + 1) % 3] + sides[(index +2) % 3])) || sides[index] == 0
    end

    @kind = case
    when (side1 == side2 && side1 != side3) || (side1 == side3 && side1 != side2) || (side2 == side3 && side2 != side1)
      :isosceles
    when (side1 == side2 && side2 == side3)
      :equilateral
    when (side1 != side2 && side2 != side3 && side1 != side3)
      :scalene
    end

  end

  class TriangleError < StandardError
    def message
      "Not a valid triangle. The sum of any two sides cannot equal the size of the third side."
    end
  end
end
