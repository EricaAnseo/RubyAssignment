class CreateWishlists < ActiveRecord::Migration[5.0]
  def change
    create_table :wishlists do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :list_rank

      t.timestamps
    end
  end
end
