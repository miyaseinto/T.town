class AddIndexToTweets < ActiveRecord::Migration[6.0]
  def change
    add_index :tweets, :name, length: 32
  end
end
