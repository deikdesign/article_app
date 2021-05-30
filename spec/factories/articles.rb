FactoryBot.define do
  factory :article do
    title { 'This is a new article!' }
    description { 'This is a new article description!' }
    user_id { 1 }
    category_id { 1 }
  end

  factory :random_article, class: Article do
    description { Faker::Lorem.sentence(5) }
    title { 'Random article!' }
    user_id { 6 }
    category_id { 8 }
  end
end
