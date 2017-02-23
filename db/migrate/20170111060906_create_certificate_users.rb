class CreateCertificateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :certificate_users do |t|
      t.references :user, foreign_key: true
      t.references :certification, foreign_key: true

      t.timestamps
    end
  end
end
