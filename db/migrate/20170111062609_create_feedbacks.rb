class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.string :name
      t.string :email
      t.text :content
      t.string :has_many
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
