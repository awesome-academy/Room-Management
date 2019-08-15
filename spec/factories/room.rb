FactoryBot.define do
  factory :room do |f|
    f.name {FFaker::Name.name}
  end
end
