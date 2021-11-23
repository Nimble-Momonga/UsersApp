FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    email { Faker::Internet.email }

    trait :with_denormalized_email do
      email { " #{Faker::Internet.email.upcase} " }
    end
  end
end
