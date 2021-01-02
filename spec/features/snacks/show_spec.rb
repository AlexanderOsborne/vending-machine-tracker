require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'when I visit the show page' do

    it 'I see the price, locations and the average price and snack count of the machine at that lcoation' do
      dane = Owner.create!(name: 'Dane')
      ozzys = Machine.create!(owner: dane, location: 'Danes')
      croixs = Machine.create!(owner: dane, location: 'Alexs')

      kibble = Snack.create!(name:'Kih bul', price: 3.00)
      bonz = Snack.create!(name:'bonz', price: 2.00)

      MachineSnack.create!(snack_id: kibble.id, machine_id: ozzys.id)
      MachineSnack.create!(snack_id: kibble.id, machine_id: croixs.id)
      MachineSnack.create!(snack_id: bonz.id, machine_id: ozzys.id)

      visit "/snacks/#{kibble.id}"

      expect(page).to have_content(3.00)
      expect(page).to have_content([Danes, Alexs])
      expect(page).to have_content([2.50])
      expect(page).to have_content([3.00])
      expect(page).to have_content([2])
      expect(page).to have_content([1])
    end
  end
end