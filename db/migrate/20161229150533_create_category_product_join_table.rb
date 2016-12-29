class CreateCategoryProductJoinTable < ActiveRecord::Migration[5.0]
  def change
  		create_table :categories_products, :id => false do |t|
        	t.references :product, foreign_key: true
        	t.references :category, foreign_key: true
        end
  end
end
