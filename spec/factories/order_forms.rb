FactoryBot.define do
  factory :order_form do
    address                { '青山1-1-1' }
    postal_code            { '123-4567' }
    city                   { Gimei.address.city.kanji }
    building               { Gimei.address.town.kanji }
    phone_number           { Faker::Number.number(digits: 11) }
    delivery_prefecture_id { Faker::Number.between(from: 1, to: 47) }
    item_id                { Faker::Number.number(digits: 10) }
    user_id                { Faker::Number.number(digits: 10) }
    token                  { 'tok_abcdefghijk00000000000000000' }
  end
end
