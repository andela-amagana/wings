FactoryGirl.define do
  factory :booking do
    booking_code Faker::Code.asin
    flight_id Faker::Number.number(2)
    email "precious.thiel@murazikbalistreri.name"
    flight
  end
end
