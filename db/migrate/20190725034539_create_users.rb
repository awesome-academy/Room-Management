class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone
      t.string :idCart
      t.string :username
      t.string :password
      t.integer :role
      t.integer :count
      t.string :password_digest

      t.timestamps
    end
  end
end
