class CreateHomes < ActiveRecord::Migration[5.0]
  def change
    create_table :homes do |t|
      t.string :title
      t.string :sologan
      t.text :description
      t.string :language

      t.timestamps
    end
  end
end
