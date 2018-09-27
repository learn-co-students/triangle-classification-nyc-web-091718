class Triangle
  attr_reader :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def valid?
    if side1 <= 0 || side2 <= 0 || side3 <= 0
      return FALSE
    elsif side1 + side2 <= side3 || side2 + side3 <= side1 || side1 + side3 <= side2
      return FALSE
    else
      return TRUE
    end
  end

  def kind
    if self.valid?
      if side1 == side2 && side2 == side3
        :equilateral
      elsif side1 == side2 || side2 == side3 || side1 == side3
        :isosceles
      elsif side1 != side2 && side2 != side3 && side1 != side3
        :scalene
      end
    else
      begin
        raise TriangleError
      end
    end
  end

  class TriangleError < StandardError

  end
end
