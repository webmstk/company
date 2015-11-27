require_relative '../feature_helper'

feature 'edit the person' do
  given!(:person) { create :person }
  given(:another) { build :person }

  scenario 'edit the person' do
    visit people_path

    fields = [:name, :lastname, :email, :phone, :birthday]

    click_on 'редактировать'
    expect(current_path).to eq edit_person_path(person)

    fill_in 'Имя', with: another.name
    fill_in 'Фамилия', with: another.lastname
    fill_in 'Email', with: another.email
    fill_in 'Телефон', with: another.phone
    fill_in 'День рождения', with: another.birthday

    click_on 'Сохранить изменения'
    expect(current_path).to eq person_path(person)

    fields.each do |field|
      expect(page).to have_content another.send(field)
      expect(page).to_not have_content person.send(field)
    end
  end
end