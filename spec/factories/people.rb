FactoryGirl.define do
  factory :person do
    name { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    phone { Faker::PhoneNumber.subscriber_number(3) }
    birthday { Faker::Date.between(30.years.ago, 20.years.ago) }
  end

  factory :invalid_person, class: Person do
    name nil
  end
end
