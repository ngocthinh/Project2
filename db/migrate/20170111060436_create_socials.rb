class CreateSocials < ActiveRecord::Migration[5.0]
  def change
    create_table :socials do |t|
      t.string :account
      t.integer :type
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
