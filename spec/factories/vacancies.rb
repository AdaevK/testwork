FactoryGirl.define do
  factory :vacancy do
    sequence(:name) { Faker::Lorem.word }
    validity Faker::Date.forward(20)
    sequence(:salary) { Faker::Number.number(5) }
    sequence(:contacts) { Faker::Internet.free_email }

    factory :vacancy_inactive do
      validity Faker::Date.backward(20)
    end
  end

end
