FactoryBot.define do
  factory :user do
    name {FFaker::Name.name}
    phone {FFaker::PhoneNumber.phone_number}
    idCart {FFaker::Lorem.characters 9}  
    email {FFaker::Internet.email}
    trait :role do
      admin {manager}
    end
    room_id {1}
    count {FFaker::Lorem.characters 1}
    password {FFaker::Lorem.characters 6}      
  end
end
