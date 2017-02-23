class CreateTargetTechniques < ActiveRecord::Migration[5.0]
  def change
    create_table :target_techniques do |t|
      t.integer :target_id
      t.string :target_type
      t.references :technique, foreign_key: true

      t.timestamps
    end
  end
end
