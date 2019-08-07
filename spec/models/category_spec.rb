require "rails_helper"

RSpec.describe Category, type: :model do
  
  subject {FactoryBot.create :category}
  
  describe ".create" do
    it {is_expected.to be_valid}
  end

  context "database" do
    it {is_expected.to have_db_column(:name).of_type :string}
    it {is_expected.to have_db_column(:price).of_type :float}
  end

  context "validations" do  
    it {is_expected.to validate_presence_of :name}
    describe "#price" do
      it {is_expected.to validate_presence_of :price}
      it {is_expected.to allow_value("123000").for :price}
    end
  end

  context "associations" do
    it {is_expected.to have_many :rooms}
  end
end
