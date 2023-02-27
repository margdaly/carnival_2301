require 'spec_helper'

RSpec.describe Visitor do
  describe '#initialize' do
    it 'can #init' do
      visitor1 = Visitor.new('Bruce', 54, '$10')

      expect(visitor1).to be_a(Visitor)
      expect(visitor1.name).to eq('Bruce')
      expect(visitor1.height).to eq(54)
      expect(visitor1.spending_money).to eq('$10')
    end

    it 'can #init different object' do
      visitor2 = Visitor.new('Mike', 57, '$15')

      expect(visitor2).to be_a(Visitor)
      expect(visitor2.name).to eq('Mike')
      expect(visitor2.height).to eq(57)
      expect(visitor2.spending_money).to eq('$15')
    end
  end
end