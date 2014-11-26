FactoryGirl.define do
  factory :vacancy do
    sequence(:name) { Faker::Lorem.word }
    validity Faker::Date.forward(20)
    sequence(:salary) { Faker::Number.number(5) }
    sequence(:contacts) { Faker::Internet.email }
  end

end
