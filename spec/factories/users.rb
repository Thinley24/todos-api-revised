# frozen_string_literal: true

FactoryBot.define do
  factory :random_user, class: User do
    email { Faker::Internet.email }
    password { Faker::Internet.password }

    trait :normal do
      role { Role.find_by(name: 'User') }
    end
    trait :admin do
      role { Role.find_by(name: 'Admin') }
    end
  end
end
