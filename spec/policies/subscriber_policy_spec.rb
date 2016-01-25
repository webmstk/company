require 'rails_helper'

describe SubscriberPolicy do
  subject { SubscriberPolicy.new(user, subscriber) }

  let(:subscriber) { create :subscriber }

  context 'for guest' do
    let(:user) { nil }

    it { should_not permit :create }
    it { should_not permit :destroy }
    it { should_not permit :notify }
  end

  context 'for user' do
    let(:user) { create :user }

    it { should permit :create }
    it { should permit :destroy }
    it { should permit :notify }
  end
end