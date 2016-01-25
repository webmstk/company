FactoryGirl.define do
  factory :subscriber do
    email { Faker::Internet.free_email }
  end

end
