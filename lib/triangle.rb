class Triangle
  attr_accessor :s1, :s2, :s3

  def initialize(s1, s2, s3)
    @s1 = s1
    @s2 = s2
    @s3 = s3
  end

  def kind
    if eq_triangle == true && eq_triangle2 == true
      puts true
    else
      raise TriangleError
    end

    if s1 == s2 && s2 == s3 && s1 == s3
      :equilateral
    elsif s1 != s2 && s2 != s3 && s1 != s3
      :scalene
    else
      :isosceles
    end
  end

  def eq_triangle
    s1.positive? && s2.positive? && s3.positive?
  end

  def eq_triangle2
    s1 + s2 > s3 && s2 + s3 > s1 && s1 + s3 > s2
  end

class TriangleError < StandardError
  "Triangle Errorrr"
end

end
