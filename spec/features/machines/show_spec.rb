require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'When I visit the show page' do

    it 'I see a list of all snacks associated with a machine' do
      dane = Owner.create!(name: 'Dane')
      ozzys = Machine.create!(owner: dane, location: 'Danes')

      kibble = Snack.create!(name:'Kih bul', price: 3.00)
      bonz = Snack.create!(name:'bonz', price: 2.00)

      MachineSnack.create!(snack_id: kibble.id, machine_id: ozzys.id)
      MachineSnack.create!(snack_id: bonz.id, machine_id: ozzys.id)
      
      visit "/machines/#{ozzys.id}"
      

      expect(page).to have_content(kibble.name)
      expect(page).to have_content(kibble.price)
      expect(page).to have_content(bonz.name)
      expect(page).to have_content(bonz.price)
    end

    it 'I see a list of all snacks associated with a machine' do
      dane = Owner.create!(name: 'Dane')
      ozzys = Machine.create!(owner: dane, location: 'Danes')

      kibble = Snack.create!(name:'Kih bul', price: 3.00)
      bonz = Snack.create!(name:'bonz', price: 2.00)

      MachineSnack.create!(snack_id: kibble.id, machine_id: ozzys.id)
      MachineSnack.create!(snack_id: bonz.id, machine_id: ozzys.id)
      
      visit "/machines/#{ozzys.id}"
      

      expect(page).to have_content(Snack.average_price)
    end
  end
end