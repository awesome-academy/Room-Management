User.create!(name:  "Nguyễn Văn A",
  phone: "0964713865",
  idCart: "012345679",
  username: "admin",
  password: "123456",
  role: 1,
  count: 0,
  created_at: Time.zone.now)

20.times do |n|
  name  = FFaker::Name.name
  phone = FFaker::PhoneNumber.phone_number
  username = "user-#{n+1}"
  password = "111"
  User.create!(name:  name,
  phone: phone,
  username: username,
  password: "111",
  role: 0,
  count: 2,
  created_at: Time.zone.now)
end
