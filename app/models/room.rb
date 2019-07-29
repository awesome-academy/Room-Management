class Room < ApplicationRecord
  ROOM_PARAMS = %i(name category_id status).freeze
  enum status: {active: 1, unactive: 0}

  belongs_to :category
  has_one :room

  scope :ordered_by_name, -> {order(name: :asc)}

  delegate :name, to: :category, prefix: true
  delegate :price, to: :category, prefix: true

  validates :name, presence: true
end
