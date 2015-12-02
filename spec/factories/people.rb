FactoryGirl.define do
  factory :person do
    name { Faker::Name.name.split(' ')[0] }
    lastname { Faker::Name.name.split(' ')[1] }
    email { Faker::Internet.free_email }
    phone { Faker::PhoneNumber.subscriber_number(3) }
    birthday { Faker::Date.between(30.years.ago, 20.years.ago) }

    factory :invalid_person do
      name nil
    end
  end
end
