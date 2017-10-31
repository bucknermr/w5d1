FactoryBot.define do
  factory :goal do
    objective { Faker::Hacker.say_something_smart }
    user_id 1
    completed false
    shared true
  end
end
