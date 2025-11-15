require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'Order model associations' do
    before do
      @order = FactoryBot.build(:order)
    end

    it 'is invalid without a user' do
      @order.user = nil
      @order.valid?
      expect(@order.errors.full_messages).to include('User must exist')
    end

    it 'is invalid without an item' do
      @order.item = nil
      @order.valid?
      expect(@order.errors.full_messages).to include('Item must exist')
    end
  end
end
