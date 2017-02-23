class CreateCertifications < ActiveRecord::Migration[5.0]
  def change
    create_table :certifications do |t|
      t.string :name
      t.string :description
      t.string :image

      t.timestamps
    end
  end
end
