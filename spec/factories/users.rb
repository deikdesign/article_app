FactoryBot.define do
  factory :user do
    email { 'gh@email.com' }
    password { 'password' }
  end

  factory :random_user, class: User do
    email { Faker::Internet.safe_email }
    password { 'password' }
  end
end
