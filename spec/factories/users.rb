FactoryBot.define do
  # factory :user do
  #   email 'norzang607@gmail.com'
  #   encrypted_password 'norzang607'
  # end

  factory :random_user, class: User do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
