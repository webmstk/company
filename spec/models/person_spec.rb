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

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:lastname) }

  describe '#full_name' do
    let(:person) { create :person }

    it 'returns full person name' do
      expect(person.full_name).to eq [person.name, person.lastname].join(' ')
    end
  end
end
