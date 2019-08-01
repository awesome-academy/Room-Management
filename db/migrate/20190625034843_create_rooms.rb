class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.references :category, foreign_key: true
      t.float :price
      t.integer :status
      t.integer :payment
      
      t.timestamps
    end
  end
end
