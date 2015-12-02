require_relative '../feature_helper'

feature 'delete the person' do
  given!(:person) { create :person }

  describe 'as user' do
    given(:user) { create :user }

    scenario 'delete the person' do
      sign_in(user)
      visit people_path
      click_on 'уволить'

      expect(current_path).to eq people_path
      expect(page).to_not have_content person.full_name
      expect(page).to have_content 'Сотрудник успешно удалён!'
    end
  end

  describe 'as guest' do
    scenario 'cannot see delete links' do
      visit people_path
      expect(page).to_not have_link 'уволить'
    end
  end
end