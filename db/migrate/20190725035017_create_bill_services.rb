class CreateBillServices < ActiveRecord::Migration[6.0]
  def change
    create_table :bill_services do |t|
      t.references :service, foreign_key: true
      t.references :bill, foreign_key: true
      t.float :price

      t.timestamps
    end
  end
end
