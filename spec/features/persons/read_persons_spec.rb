require_relative '../feature_helper'

feature "read list of persons" do
  given!(:persons) { create_list(:person, 1) }

  scenario "user can see list of all persons" do
    visit persons_path

    persons.each do |person|
      expect(page).to have_content(person.name)
    end
  end

end
