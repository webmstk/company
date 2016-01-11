require 'rails_helper'

RSpec.describe Person, type: :model do
  it { should respond_to :name }
  it { should respond_to :lastname }
  it { should respond_to :email }
  it { should respond_to :phone }
  it { should respond_to :birthday }
  it { should respond_to :created_at }
  it { should respond_to :updated_at }
  it { should respond_to :birthday_sort }
  it { should respond_to :full_name }


  # name
  it { should validate_presence_of(:name)
                  .with_message('Имя не должно быть пустым') }
  it { should validate_length_of(:name)
                  .is_at_least(2).with_short_message('Имя должно содержать не менее 2 символов')
                  .is_at_most(20).with_long_message('Имя должно содержать не более 20 символов') }

  good_names = %w(Паша ПАША паша)
  bad_names = %w(Паша1 1234 Pasha Паша. Па\ ша)
  it { should allow_values(*good_names).for(:name) }
  it { should_not allow_values(*bad_names).for(:name)
                      .with_message('Разрешены только символы русского и латинского алфавита') }


  # lastname
  it { should validate_presence_of(:lastname)
                  .with_message('Фамилия не должна быть пустой') }
  it { should validate_length_of(:lastname)
                  .is_at_least(2).with_short_message('Фамилия должна содержать не менее 2 символов')
                  .is_at_most(20).with_long_message('Фамилия должна содержать не более 20 символов') }

  good_lastnames = %w(Бакун БАКУН бакун)
  bad_lastnames = %w(Бакун1 1234 Bakun Бакун. Ба\ кун)
  it { should allow_values(*good_lastnames).for(:lastname) }
  it { should_not allow_values(*bad_lastnames).for(:lastname)
                      .with_message('Разрешены только символы русского и латинского алфавита') }


  # email
  it { should allow_values('eta@svarbi.ru', 'eta').for(:email) }
  it { should_not allow_values('@etasvarbi.ru', 'eta@').for(:email)
                      .with_message('Email не выглядит правильным') }


  # phone
  it { should validate_length_of(:phone)
                  .is_equal_to(3)
                  .with_message('Телефон должен состоять из 3 цифр') }
  it { should validate_numericality_of(:phone)
                  .only_integer.with_message('Телефон может содержать только цифры')
                  .allow_nil }

  # birthday_sort
  # describe '.birthday_order' do
  #   let!(:now) { Date.parse('1986-03-01') }
  #   let!(:person1) { create :person, birthday: Date.parse('1986-02-01') }
  #   let!(:person2) { create :person, birthday: Date.parse('1986-01-01') }
  #   let!(:person3) { create :person, birthday: Date.parse('1986-04-01') }
  #   let!(:person4) { create :person, birthday: Date.parse('1986-05-01') }

  #   it 'sort people by day of birth' do
  #     expect(Time).to receive(:now).and_return(now)
  #     expect(Person.birthday_order).to eq [person3, person4, person2, person1]
  #   end
  # end


  # methods
  describe '#full_name' do
    let(:person) { create :person }

    it 'returns full person name' do
      expect(person.full_name).to eq [person.lastname, person.name].join(' ')
    end
  end

  # describe '#complete_email' do
  #   let(:person) { build :person, email: 'test' }
  #
  #   it 'completes string with @svarbi.ru if string given' do
  #     person.complete_email
  #     expect(person.email).to eq 'test@svarbi.ru'
  #   end
  #
  #   it 'does not change valid email' do
  #     person.email = 'test@svarbi.ru'
  #     person.complete_email
  #     expect(person.email).to eq 'test@svarbi.ru'
  #   end
  # end
end
