require_relative '../feature_helper'

feature 'edit the person' do
  given!(:person) { create :person }
  given(:another) { build :person }

  describe 'as user' do
    given(:user) { create :user }

    context 'with valid params' do
      scenario 'edit the person' do
        sign_in(user)
        visit people_path

        fields = [:name, :lastname, :email, :phone, :birthday]

        click_on 'редактировать'
        expect(current_path).to eq edit_person_path(person)
        fill_in 'Имя', with: another.name
        fill_in 'Фамилия', with: another.lastname
        fill_in 'Email', with: another.email
        fill_in 'Телефон', with: another.phone
        fill_in 'День рождения', with: RussianDate::date_to_rus(another.birthday)

        click_on 'Сохранить изменения'
        expect(current_path).to eq person_path(person)

        fields.each do |field|
          expect(page).to have_content another.send(field)
          expect(page).to_not have_content person.send(field)
        end
      end
    end

    context 'with valid params' do
      scenario 'edit the person' do
        sign_in(user)
        visit people_path

        fields = [:name, :lastname, :email, :phone, :birthday]

        click_on 'редактировать'
        expect(current_path).to eq edit_person_path(person)

        fill_in 'Имя', with: 'x'
        fill_in 'Фамилия', with: '*&^'
        fill_in 'Email', with: 'etasvarbiru'
        fill_in 'Телефон', with: '8870'
        fill_in 'День рождения', with: '29541986'

        click_on 'Сохранить изменения'
        expect(current_path).to eq person_path(person)

        expect(page).to have_css('#error_explanation')
        expect(page).to have_content('Сотрудник не сохранён!')
      end
    end
  end

  describe 'as guest' do
    scenario 'cannot see edit links' do
      visit people_path
      expect(page).to_not have_link 'редактировать'

      visit person_path(person)
      expect(page).to_not have_link 'Редактировать'
    end

    scenario 'redirect to login_path' do
      visit edit_person_path(person)
      expect(current_path).to eq login_path
      expect(page).to have_content 'У вас нет прав на данное действие'
    end
  end
end