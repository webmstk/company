require_relative '../feature_helper'

feature 'create new person' do
  scenario 'create new person' do
    visit people_path

    click_on 'Новый сотрудник'

    fill_in 'Имя', with: 'Паша'
    fill_in 'Фамилия', with: 'Бакун'
    fill_in 'Email', with: 'eta@svarbi.ru'
    fill_in 'Телефон', with: '887'
    fill_in 'День рождения', with: '29 01 1986'

    click_on 'Создать сотрудника'
  end
end