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
    visitor.spending_money = visitor.spending_money.delete_prefix('$').to_i
    visitor.spending_money = visitor.spending_money - @admission_fee
    # count = 0
    # if @ride_log.has_key?(visitor)
    #   @ride_log.merge(@ride_log[visitor] = count += 1)
    # else 
    #   @ride_log[visitor] = count += 1
    # end
  end

  def check_visitor(visitor)
    visitor.preferences.include?(@excitement) && visitor.spending_money.delete_prefix('$').to_i >= @admission_fee && visitor.height >= @min_height
  end
end
