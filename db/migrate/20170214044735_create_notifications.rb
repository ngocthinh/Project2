class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.integer :notificationable_id
      t.string :notificationable_type
      t.string :notice_type
      t.boolean :read, default: false
      t.boolean :checked, default: false
      t.references :user, foreign_key: true
      t.references :user_create

      t.timestamps null: false
    end
    add_index :notifications, ["notificationable_id", "notificationable_type"], name: "fk_notificationables"
    add_index :notifications, [:read, :checked]
  end
end
