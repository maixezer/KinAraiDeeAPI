class CreateFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.text :tags, array: true, default: []
      t.float :calories, default: 0.0

      t.timestamps
    end
  end
end
