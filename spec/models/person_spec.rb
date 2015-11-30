require 'rails_helper'

RSpec.describe Person, type: :model do
  it { should respond_to :name }
  it { should respond_to :lastname }
  it { should respond_to :email }
  it { should respond_to :phone }
  it { should respond_to :birthday }
  it { should respond_to :created_at }
  it { should respond_to :updated_at }
  it { should respond_to :full_name }


  # name
  it { should validate_presence_of(:name)
                  .with_message('Имя не должно быть пустым') }
  it { should validate_length_of(:name)
                  .is_at_least(2).with_short_message('Имя должно содержать не менее 2 символов')
                  .is_at_most(20).with_long_message('Имя должно содержать не более 20 символов') }

  good_names = %w(Паша ПАША паша Pasha PASHA pasha)
  bad_names = %w(Паша1 1234 Pasha. Па\ ша)
  it { should allow_values(*good_names).for(:name) }
  it { should_not allow_values(*bad_names).for(:name)
                      .with_message('Разрешены только символы русского и латинского алфавита') }


  # lastname
  it { should validate_presence_of(:lastname)
                  .with_message('Фамилия не должна быть пустой') }
  it { should validate_length_of(:lastname)
                  .is_at_least(2).with_short_message('Фамилия должна содержать не менее 2 символов')
                  .is_at_most(20).with_long_message('Фамилия должна содержать не более 20 символов') }

  good_lastnames = %w(Бакун БАКУН бакун Bakun BAKUN bakun)
  bad_lastnames = %w(Бакун1 1234 Bakun. Ba\ kun)
  it { should allow_values(*good_lastnames).for(:lastname) }
  it { should_not allow_values(*bad_lastnames).for(:lastname)
                      .with_message('Разрешены только символы русского и латинского алфавита') }


  # email
  it { should allow_values('eta@svarbi.ru', '').for(:email) }
  it { should_not allow_values('etasvarbi.ru', 'eta@svarbi.ru').for(:email)
                      .with_message('Email не выглядит правильным') }


  # phone
  it { should validate_length_of(:phone)
                  .is_equal_to(3)
                  .with_message('Телефон должен состоять из 3 цифр') }
  it { should validate_numericality_of(:phone)
                  .only_integer.with_message('Телефон может содержать только цифры')
                  .allow_nil }


  # methods
  describe '#full_name' do
    let(:person) { create :person }

    it 'returns full person name' do
      expect(person.full_name).to eq [person.name, person.lastname].join(' ')
    end
  end
end
