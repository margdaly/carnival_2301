require 'spec_helper'

RSpec.describe Ride do
  describe '#initialize' do
    it 'can #init' do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })

      expect(ride1).to be_a(Ride)
      expect(ride1.name).to eq('Carousel')
      expect(ride1.min_height).to eq(24)
      expect(ride1.admission_fee).to eq(1)
      expect(ride1.excitement).to eq(:gentle)
    end

    it 'can #init a different object' do
      ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })

      expect(ride2).to be_a(Ride)
      expect(ride2.name).to eq('Ferris Wheel')
      expect(ride2.min_height).to eq(36)
      expect(ride2.admission_fee).to eq(5)
      expect(ride2.excitement).to eq(:gentle)
    end
  end
end