class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :prodname
      t.text :description
      t.integer :price
      t.integer :ship_cost
      t.integer :stock
      t.text :img_path
      t.timestamp :lastUpdated
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :products, [:user_id, :created_at]
  end
end
