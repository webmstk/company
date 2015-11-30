require_relative '../feature_helper'

feature 'read list of people' do
  given!(:people) { create_list(:person, 2) }

  scenario 'user can see list of all people' do
    visit people_path

    people.each do |person|
      expect(page).to have_content(person.name)
    end
  end

end
