class CreateReputations < ActiveRecord::Migration[5.0]
  def change
    create_table :reputations do |t|
      t.references :reviewer, foreign_key: true
      t.references :reviewee, foreign_key: true
      t.integer :rating
      t.string :comment

      t.timestamps
    end
  end
end
