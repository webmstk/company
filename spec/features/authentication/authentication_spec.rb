require_relative '../feature_helper'

feature 'authenticate user' do
  given(:user) { create :user }

  scenario 'existing user tries to login' do
    sign_in(user)

    expect(current_path).to eq root_path
    expect(page).to have_content 'Вход успешно выполнен'
    expect(page).to_not have_link 'Вход'

    visit login_path
    expect(page).to have_content 'Вход уже выполнен'
    click_on 'Выйти'

    expect(current_path).to eq root_path
    expect(page).to have_content 'Выход выполнен успешно'
  end

  scenario 'non-existing user tries to authenticate' do
    visit root_path
    click_on 'Вход'

    fill_in 'Логин', with: 'бармалей'
    fill_in 'Пароль', with: ''
    click_on 'Войти'

    expect(current_path).to eq login_path
    expect(page).to have_css '.alert-danger'
    expect(page).to have_content 'Неправильный логин/пароль'
  end

  scenario 'logged user tries to logout' do
    sign_in(user)
    visit root_path

    click_on 'Выход'

    expect(current_path).to eq root_path
    expect(page).to have_content 'Выход выполнен успешно'
  end
end