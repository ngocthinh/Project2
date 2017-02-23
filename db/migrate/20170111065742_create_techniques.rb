class CreateTechniques < ActiveRecord::Migration[5.0]
  def change
    create_table :techniques do |t|
      t.string :skill

      t.timestamps
    end
  end
end
