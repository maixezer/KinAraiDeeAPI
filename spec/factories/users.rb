FactoryGirl.define do
  factory :user do
    email { FFaker::Internet.email }
    password '12345678'
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
  end
end
