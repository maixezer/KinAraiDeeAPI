FactoryGirl.define do
  factory :store do
    name { FFaker::Company.name }
    lat { FFaker::Geolocation.lat }
    lng { FFaker::Geolocation.lng }
  end
end
