FactoryGirl.define do
  factory :post do
    title { Faker::Lorem.word }
    content { Faker::Lorem.paragraph }
    user_ip { Faker::Internet.ip_v4_address }
    user
  end
end