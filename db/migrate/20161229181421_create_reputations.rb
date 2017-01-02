class CreateReputations < ActiveRecord::Migration[5.0]
  def change
    create_table :reputations do |t|
      t.belongs_to :reviewer, foreign_key: true, references: :users
      t.belongs_to :reviewee, foreign_key: true, references: :users
      t.integer :rating
      t.string :comment

      t.timestamps
    end
  end
end
