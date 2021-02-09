FactoryBot.define do
  factory :item do
    association :user
    association :category
    association :prefecture
    association :sales_status
    association :scheduled_delivery
    association :shipping_fee_status

    name                   { Faker::Team.name }
    info                   { Faker::Lorem.sentence }
    price                  { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id            { Faker::Number.between(from: 1, to: 10) }
    sales_status_id        { Faker::Number.between(from: 1, to: 6) }
    scheduled_delivery_id  { Faker::Number.between(from: 1, to: 3) }
    shipping_fee_status_id { Faker::Number.between(from: 1, to: 2) }
    prefecture_id          { Faker::Number.between(from: 1, to: 47) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
