require 'rails_helper'

describe PersonPolicy do
  subject { PersonPolicy.new(user, person) }

  let(:person) { create :person }

  context 'for guest' do
    let(:user) { nil }

    it { should permit(:index) }
    it { should permit(:show) }

    it { should_not permit(:new) }
    it { should_not permit(:create) }
    it { should_not permit(:edit) }
    it { should_not permit(:update) }
    it { should_not permit(:destroy) }
  end

  context 'for user' do
    let(:user) { create :user }

    it { should permit(:index) }
    it { should permit(:show) }
    it { should permit(:new) }
    it { should permit(:create) }
    it { should permit(:edit) }
    it { should permit(:update) }
    it { should permit(:destroy) }
  end
end
