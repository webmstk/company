require_relative '../feature_helper'

feature 'read the person' do
  given(:person) { create :person }

  scenario 'read the person' do
    visit person_path(person)

    fields = [:email, :phone, :birthday]

    fields.each do |field|
      expect(page).to have_content person.send(field)
    end
  end
end