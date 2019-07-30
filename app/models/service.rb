class Service < ApplicationRecord
  SERVICE_PARAMS = %i(name price).freeze

  has_many :bill_services
  has_many :bills, through: :bill_services

  scope :ordered_by_number, -> {order name: :asc}

  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :price, presence: true
end
