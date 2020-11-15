class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :name
      t.string :image
      t.text :text
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :user_id,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
