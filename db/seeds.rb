require "ffaker"

2.times do |n|
  name  = "Category#{n+1}"
  Category.create!(name:  name,
  price: 1000000,
  created_at: Time.zone.now)
end

10.times do |n|
  name  = "Room#{n+1}"
  Room.create!(name:  name,
  category_id: 1,
  status: 0,
  payment: 0,
  created_at: Time.zone.now)
end

10.times do |n|
  name  = "Room#{n+10}"
  Room.create!(name:  name,
  category_id: 1,
  status: 0,
  payment: 0,
  created_at: Time.zone.now)
end

User.create!(name:  "admin123456",
  phone: "0964713865",
  password: "123456",
  password_confirmation: "123456",
  idCart: "01234567897",
  email: "haidang1196@gmail.com",
  role: 1,
  count: 3,
  status: 0,
   room_id:1,
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
  status: 0,
  room_id: 1,
  created_at: Time.zone.now)
end

4.times do |n|
  name  = "Service#{n+1}"
  Service.create!(name:  name,
  price: 100000,
  created_at: Time.zone.now)
end

1.times do |n|
  Bill.create!(user_id:  2,
  room_id: 1,
  electrical_number: 100,
  status: 0,
  created_at: Time.zone.now)
end

1.times do |n|
  BillService.create!(service_id:  1,
  bill_id: 1, 
  price: 20000,
  created_at: Time.zone.now)
end

1.times do |n|
  Bill.create!(user_id:  2,
  room_id: 1,
  electrical_number: 100,
  status: 0,
  created_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
50.times do |n|
  title = "title#{n+1}"
  detail = "detail#{n+1}"
  users.each { |user| user.feed_backs.create!(
    title: title,
    detail: detail)
   }
end
