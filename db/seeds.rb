require "ffaker"

User.create!(name:  "admin123456",
  phone: "0964713865",
  password: "123456",
  password_confirmation: "123456",
  idCart: "01234567897",
  email: "haidang1196@gmail.com",
  role: 1,
  count: 3,
  created_at: Time.zone.now)

 20.times do |n|
  name  = FFaker::Name.name
  email = "userdd#{n+1}@gmail.com"
  password = "123456"
  phone = FFaker::PhoneNumber.phone_number
  User.create!(name:  name,
  phone: phone,
  password: "123456",
  password_confirmation: "123456",
  idCart: "1111111111",
  email: email,
  role: 0,
  count: 2,
  created_at: Time.zone.now)
end
