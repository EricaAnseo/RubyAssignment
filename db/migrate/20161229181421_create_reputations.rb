class CreateReputations < ActiveRecord::Migration[5.0]
  def change
    create_table :reputations do |t|
      t.references :user, :reviewer, references: :users
      t.references :user, :reviewee, references: :users
      t.integer :rating
      t.string :comment

      t.timestamps
    end
  end
end
