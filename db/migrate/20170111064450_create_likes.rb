class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.integer :target_id
      t.string :target_type
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
