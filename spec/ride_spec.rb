require 'spec_helper'

RSpec.describe Ride do
  before(:each) do
    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')
  end

  describe '#initialize' do
    it 'can #init' do
      expect(@ride1).to be_a(Ride)
      expect(@ride1.name).to eq('Carousel')
      expect(@ride1.min_height).to eq(24)
      expect(@ride1.admission_fee).to eq(1)
      expect(@ride1.excitement).to eq(:gentle)
    end

    it 'can #init a different object' do
      expect(@ride2).to be_a(Ride)
      expect(@ride2.name).to eq('Ferris Wheel')
      expect(@ride2.min_height).to eq(36)
      expect(@ride2.admission_fee).to eq(5)
      expect(@ride2.excitement).to eq(:gentle)
    end
  end

  describe '#check_visitor' do
    it 'checks if visitor tall_enough, enough money, and checks excitment' do
      @visitor1.add_preference(:gentle)
      @visitor2.add_preference(:gentle)

      expect(@ride1.check_visitor(@visitor1)).to eq(true)
      expect(@ride3.check_visitor(@visitor2)).to eq(false)
    end
  end

  describe '#board_rider' do
    it 'logs who has ridden and how many times' do
      @visitor1.add_preference(:gentle)
      @visitor2.add_preference(:gentle)
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor2)
      @ride1.board_rider(@visitor1)

      expect(@ride1.ride_log).to eq({@visitor1=>2, @visitor2=>1})
    end

    it 'reduces spending_money of visitor ' do
      @visitor1.add_preference(:gentle)
      @visitor2.add_preference(:gentle)
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor2)
      @ride1.board_rider(@visitor1)

      expect(@visitor1.spending_money).to eq(8)
      expect(@visitor2.spending_money).to eq(4)
    end

    it 'increases rides revenue' do
      expect(@ride1.total_revenue).to eq(0)

      @visitor1.add_preference(:gentle)
      @visitor2.add_preference(:gentle)
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor2)
      @ride1.board_rider(@visitor1)

      expect(@ride1.total_revenue).to eq(3)
    end
  end
end