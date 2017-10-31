FactoryBot.define do
  factory :user do
    username { Faker::Hobbit.character }
    password { Faker::Internet.password }
  end
end
