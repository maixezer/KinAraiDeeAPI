class CreateFoodsStores < ActiveRecord::Migration[5.0]
  def change
    create_table :foods_stores do |t|
      t.integer :store_id
      t.integer :food_id
    end
  end
end
