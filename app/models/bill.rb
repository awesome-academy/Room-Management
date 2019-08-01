class Bill < ApplicationRecord
  BILL_PARAMS = %i(user_id room_id electrical_number).freeze

  belongs_to :user
  belongs_to :room
  has_many :bill_services, dependent: :destroy

  delegate :email, to: :user, prefix: true
  delegate :name, to: :user, prefix: true
  delegate :name, to: :room, prefix: true
  delegate :price, to: :room, prefix: true
end
