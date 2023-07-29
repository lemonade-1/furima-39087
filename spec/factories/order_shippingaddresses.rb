FactoryBot.define do
  factory :order_shippingaddress do
    user_id { Faker::Number.non_zero_digit }
    item_id { Faker::Number.non_zero_digit }
    postcode { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { Faker::Address.city }
    block { Faker::Address.street_name }
    building { Faker::Name.name }
    phone_number { Faker::Number.decimal_part(digits: 11) }
  end
end
