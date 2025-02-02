class Visitor
  attr_reader :name, 
              :height,
              :spending_money,
              :preferences

  def initialize(name, height, spending_money)
     @name = name
     @height = height
     @spending_money = spending_money
     @preferences = []
  end

  def add_preference(info)
    @preferences << info
  end

  def tall_enough?(min_height)
    @height >= min_height
  end
end
