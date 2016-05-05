FactoryGirl.define do
  factory :god, class: 'User' do
    email 'god@kad.com'
    password '12345678'
    first_name 'god'
    last_name 'damn'
    roles :god
  end

  factory :user do
    email { FFaker::Internet.email }
    password '12345678'
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
  end
end
