class BillService < ApplicationRecord
  belongs_to :bill
  belongs_to :bill_service
end
