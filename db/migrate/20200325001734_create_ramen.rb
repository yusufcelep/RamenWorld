class CreateRamen < ActiveRecord::Migration[6.0]
  def change
    create_table :ramen do |t|
      t.string :name
      t.float :price
      t.string :image_url
      t.integer :shop_id

      t.timestamps
    end
  end
end
