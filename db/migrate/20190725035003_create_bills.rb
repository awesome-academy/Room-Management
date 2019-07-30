class CreateBills < ActiveRecord::Migration[6.0]
  def change
    create_table :bills do |t|
      t.references :user, foreign_key: true
      t.integer :electrical_number
      t.references :room, foreign_key: true
      t.integer :status
            
      t.timestamps
    end
  end
end
