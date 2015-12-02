require 'rails_helper'

RSpec.describe User, type: :model do
  it { should respond_to :login }
  it { should respond_to :password }

  it { should validate_presence_of(:login).with_message('Не введен логин') }
  it { should validate_uniqueness_of(:login).with_message('Логин занят') }

  it { should validate_presence_of(:password).with_message('Не введен пароль') }
end
