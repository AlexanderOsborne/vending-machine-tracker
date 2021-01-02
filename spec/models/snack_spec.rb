require 'rails_helper'

RSpec.describe Snack, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :price}
  end

  describe 'class methods' do
    it 'averages snack prices' do
    kibble = Snack.create!(name:'Kih bul', price: 3.00)
    bonz = Snack.create!(name:'bonz', price: 2.00)

    expect(Snack.average_price).to eq(2.50)
    end
  end
end
