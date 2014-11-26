FactoryGirl.define do
  factory :employee do
    sequence(:name) { Faker::Name.name }
    sequence(:contacts) { Faker::Internet.free_email }
    status "looking"
    sequence(:salary) { Faker::Number.number(5) }
  end

end
