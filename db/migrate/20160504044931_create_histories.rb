class CreateHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :histories do |t|
      t.integer :user_id
      t.integer :food_id
      t.timestamps
    end
  end
end
