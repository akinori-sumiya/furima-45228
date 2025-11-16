FactoryBot.define do
  factory :order_address do
    postal_code   { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city          { Faker::Address.city }
    addresses     { Faker::Address.street_address }
    building      { Faker::Address.secondary_address }
    phone_number  { Faker::Number.decimal_part(digits: 11) }
    token         { "tok_#{Faker::Alphanumeric.alphanumeric(number: 28)}" }
  end
end
