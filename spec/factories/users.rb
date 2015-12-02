FactoryGirl.define do
  sequence :login do |n|
    "login#{n}"
  end

  factory :user do
    login
    password "password"

    factory :invalid_user do
      login nil
    end
  end

end
