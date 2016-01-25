require 'rails_helper'

describe SettingPolicy do
  subject { SettingPolicy.new(user, :setting) }

  context 'for guest' do
    let(:user) { nil }

    it { should_not permit :index }
  end

  context 'for user' do
    let(:user) { create :user }

    it { should permit :index }
  end
end