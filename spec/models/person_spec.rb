require 'rails_helper'

RSpec.describe Person, type: :model do
  it { should respond_to :firstname }
  it { should respond_to :lastname }
  it { should respond_to :email }
  it { should respond_to :phone }
  it { should respond_to :firstname }

  it { should validate_presence_of(:firstname) }
  it { should validate_presence_of(:lastname) }
end
