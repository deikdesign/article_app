FactoryBot.define do
  factory :review do
    comment { 'Amazing article!!!' }
    user_id { 1 }
    rating { 2 }
  end
end
