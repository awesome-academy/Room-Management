class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone
      t.string :idCart
      t.string :email
      t.integer :role
      t.integer :count
      t.references :room, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
