class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.integer :categoryID
      t.string :category_name
      t.text :category_desc

      t.timestamps
    end
  end
end
