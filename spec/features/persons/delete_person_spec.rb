require_relative '../feature_helper'

feature 'delete the person' do
  given!(:person) { create :person }

  scenario 'delete the person' do
    visit people_path
    click_on 'Уволить'

    expect(current_path).to eq people_path
    expect(page).to_not have_content person.full_name
  end
end