class Triangle
  attr_accessor :one, :two, :three

  def initialize(one, two, three)
    @one = one
    @two = two
    @three = three
  end

  def kind
    validate
    if @one == @two && @two == @three
      :equilateral
    elsif @one == @two || @one == @three || @two == @three
      :isosceles
    else
      :scalene
    end
  end

  def validate
    if @one < 0 || @two < 0 || @three < 0
      raise TriangleError
    elsif (@one + @two > @three) && (@two + @three > @one) && (@one + @three > @two)
      true
    else
      raise TriangleError
    end
  end

  class TriangleError < StandardError
    # def message
    #   "This isn't a triangle!"
    # end
  end

end
