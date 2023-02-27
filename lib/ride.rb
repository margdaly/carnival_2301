class Ride
  attr_reader :name,
              :min_height,
              :admission_fee,
              :excitement,
              :total_revenue,
              :ride_log
 
  def initialize(info)
    @name = info[:name]
    @min_height = info[:min_height]
    @admission_fee = info[:admission_fee]
    @excitement = info[:excitement]
    @total_revenue = 0
    @ride_log = {}
  end

  def board_rider(visitor)
    @check_visitor
    @total_revenue += @admission_fee
    new_visitor = Visitor.new(visitor.name, visitor.height, visitor.spending_money.delete_prefix!('$').to_i)
    new_visitor.spending_money - @admission_fee
    if @ride_log.has_key?(new_visitor)
      @ride_log[new_visitor] += 1
    else 
      @ride_log[new_visitor] = 1
    end
  end

  def check_visitor(visitor)
    visitor.preferences.include?(@excitement) && visitor.spending_money.delete_prefix('$').to_i >= @admission_fee && visitor.tall_enough?(@min_height)
  end
end
