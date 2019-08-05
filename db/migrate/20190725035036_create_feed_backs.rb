class CreateFeedBacks < ActiveRecord::Migration[6.0]
  def change
    create_table :feed_backs do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :detail
      t.integer :status
      
      t.timestamps
    end
  end
end
