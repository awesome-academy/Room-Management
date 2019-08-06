FactoryBot.define do
  factory :category do |f|
    f.name {FFaker::Name.name}
    f.price {FFaker::Random.rand 200000}
  end
end
