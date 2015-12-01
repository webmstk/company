require_relative '../feature_helper'

feature 'create new person' do

  context 'with valid params' do
    scenario 'create new person' do
      visit people_path

      click_on 'Новый сотрудник'
      expect(current_path).to eq new_person_path

      fill_in 'Имя', with: 'Паша'
      fill_in 'Фамилия', with: 'Бакун'
      fill_in 'Email', with: 'eta@svarbi.ru'
      fill_in 'Телефон', with: '887'
      fill_in 'День рождения', with: '29 января 1986'

      click_on 'Создать сотрудника'

      expect(current_path).to eq people_path
      expect(page).to_not have_css('#error_explanation')
      expect(page).to have_content('Сотрудник успешно создан!')
    end
  end

  context 'with invalid params' do
    scenario 'shows errors to user' do
      visit people_path

      click_on 'Новый сотрудник'
      expect(current_path).to eq new_person_path

      fill_in 'Имя', with: 'x'
      fill_in 'Фамилия', with: '*&^'
      fill_in 'Email', with: 'etasvarbiru'
      fill_in 'Телефон', with: '8870'
      fill_in 'День рождения', with: '29541986'

      click_on 'Создать сотрудника'

      expect(current_path).to eq people_path
      expect(page).to have_css('#error_explanation')
      expect(page).to have_content('Сотрудник не сохранён!')
    end
  end
end