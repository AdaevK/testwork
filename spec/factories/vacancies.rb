FactoryGirl.define do
  factory :vacancy do
    sequence(:name) { Faker::Lorem.word }
    validity Faker::Date.forward(20)
    sequence(:salary) { Faker::Number.number(5) }
    sequence(:contacts) { Faker::Internet.free_email }
    sequence(:skill_list) { Faker::Lorem.word }

    factory :vacancy_inactive do
      validity Faker::Date.backward(20)
    end

    factory :vacancy_ruby do
      skill_list "ruby"
    end
  end

end
