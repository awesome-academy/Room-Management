class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.references :category, foreign_key: true
      t.integer :status
      
      t.timestamps
    end
  end
end
