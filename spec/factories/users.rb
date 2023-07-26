# frozen_string_literal: true

FactoryBot.define do
  factory :random_user, class: User do
    email { Faker::Internet.email }
    password { Faker::Internet.password }

    trait :normal do
      association :role, factory: :role
    end
    trait :admin do
      association :role, factory: [:role, :admin]
    end
  end
end
