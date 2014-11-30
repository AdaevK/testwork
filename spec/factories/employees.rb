FactoryGirl.define do
  factory :employee do
    sequence(:name) { Faker::Name.name }
    sequence(:contacts) { Faker::Internet.free_email }
    status "looking"
    sequence(:salary) { Faker::Number.number(5) }
    sequence(:skill_list) { Faker::Lorem.word }

    factory :employee_ruby do
      skill_list "ruby"
    end
  end

end
