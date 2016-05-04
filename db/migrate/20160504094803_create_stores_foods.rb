class CreateStoresFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :stores_foods do |t|
      t.integer :store_id
      t.integer :food_id
    end
  end
end
