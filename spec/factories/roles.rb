FactoryBot.define do
  factory :role do
    name { 'User' }

    trait :admin do
      name { 'Admin' }
    end
  end
end
