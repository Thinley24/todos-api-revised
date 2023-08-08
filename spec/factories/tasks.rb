# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    due_date { Faker::Date.forward(days: 7) }
    status { 'pending' }
    creator { nil }
    assignee { nil }

    trait :subtask do
      parent_task { nil }
    end
  end
end
