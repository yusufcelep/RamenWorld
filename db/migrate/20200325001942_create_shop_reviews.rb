class CreateShopReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :shop_reviews do |t|
      t.integer :user_id
      t.integer :shop_id
      t.integer :rating
      t.string :review

      t.timestamps
    end
  end
end
