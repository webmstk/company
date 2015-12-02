require_relative '../feature_helper'

feature 'read the person' do
  given!(:person) { create :person }

  scenario 'read the person' do
    visit people_path
    click_on person.full_name
    expect(current_path).to eq person_path(person)

    fields = [:email, :phone, :birthday]

    fields.each do |field|
      expect(page).to have_content person.send(field)
    end
  end
end