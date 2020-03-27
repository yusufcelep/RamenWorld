class CreateRecommendations < ActiveRecord::Migration[6.0]
  def change
    create_table :recommendations do |t|
      t.integer :user_id
      t.integer :ramen_id
      t.string :comments

      t.timestamps
    end
  end
end
